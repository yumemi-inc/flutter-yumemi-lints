import 'package:file/file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/extension/version_ext.dart';
import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/models/not_recommended_rule.dart';
import 'package:update_lint_rules/src/models/recommended_rule_severity.dart';
import 'package:update_lint_rules/src/output_dir.dart';

part 'analysis_options_service.g.dart';

@Riverpod(dependencies: [outputDir])
AnalysisOptionsService analysisOptionsService(AnalysisOptionsServiceRef ref) {
  final outputDir = ref.watch(outputDirProvider);
  return AnalysisOptionsService(
    outputDir: outputDir,
  );
}

class AnalysisOptionsService {
  const AnalysisOptionsService({
    required Directory outputDir,
  }) : _outputDir = outputDir;

  final Directory _outputDir;

  Future<void> updateDartLintRules({
    required Iterable<DartSdkRelease> releases,
    required Iterable<DartLintRule> lintRules,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
  }) async {
    final futures = releases.map((release) async {
      final dartSdkVersion = release.version;
      final allLintRules = lintRules.where((lintRule) {
        final since = lintRule.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });
      final filteredNotRecommendedRules = notRecommendedRules.where((r) {
        final since = r.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });
      final filteredRecommendedRuleSeverities = recommendedRuleSeverities.where(
        (r) {
          final since = r.rule.since;
          if (since is! SinceDartSdk) {
            return false;
          }
          return since.version <= dartSdkVersion;
        },
      );

      final dartOutputDir = _outputDir
          .childDirectory('dart/${dartSdkVersion.excludePatchVersion}');

      final allFile = dartOutputDir.childFile('all.yaml')
        ..createSync(recursive: true);
      await outputAllLintRules(
        outputFile: allFile,
        lintRules: allLintRules,
      );

      final recommendedFile = dartOutputDir.childFile('recommended.yaml')
        ..createSync(recursive: true);
      final recommendedIncludeContent =
          'include: package:yumemi_lints/dart/${dartSdkVersion.excludePatchVersion}/all.yaml';
      return outputRecommendedLintRules(
        outputFile: recommendedFile,
        notRecommendedRules: filteredNotRecommendedRules,
        recommendedRuleSeverities: filteredRecommendedRuleSeverities,
        includeContent: recommendedIncludeContent,
      );
    });

    await Future.wait(futures);
  }

  Future<void> updateFlutterLintRule({
    required Iterable<FlutterSdkRelease> releases,
    required Iterable<FlutterLintRule> lintRules,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
  }) async {
    final futures = releases.map((release) async {
      final flutterSdkVersion = release.version;
      final dartSdkVersion = release.dartSdkVersion;
      final allLintRules = lintRules.where((lintRule) {
        final since = lintRule.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });
      final filteredNotRecommendedRules = notRecommendedRules.where((r) {
        final since = r.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });
      final filteredRecommendedRuleSeverities = recommendedRuleSeverities.where(
        (r) {
          final since = r.rule.since;
          if (since is! SinceDartSdk) {
            return false;
          }
          return since.version <= dartSdkVersion;
        },
      );

      final flutterOutputDir = _outputDir
          .childDirectory('flutter/${flutterSdkVersion.excludePatchVersion}');

      final allFile = flutterOutputDir.childFile('all.yaml')
        ..createSync(recursive: true);
      final allIncludeContent =
          'include: package:yumemi_lints/dart/${dartSdkVersion.excludePatchVersion}/all.yaml';
      await outputAllLintRules(
        outputFile: allFile,
        lintRules: allLintRules,
        includeContent: allIncludeContent,
      );

      final recommendedFile = flutterOutputDir.childFile('recommended.yaml')
        ..createSync(recursive: true);
      final recommendedIncludeContent =
          'include: package:yumemi_lints/flutter/${flutterSdkVersion.excludePatchVersion}/all.yaml';
      return outputRecommendedLintRules(
        outputFile: recommendedFile,
        notRecommendedRules: filteredNotRecommendedRules,
        recommendedRuleSeverities: filteredRecommendedRuleSeverities,
        includeContent: recommendedIncludeContent,
      );
    });

    await Future.wait(futures);
  }

  @visibleForTesting
  Future<void> outputAllLintRules({
    required File outputFile,
    required Iterable<LintRule> lintRules,
    String includeContent = '',
  }) async {
    final contentBuffer = StringBuffer();
    contentBuffer.writeln('# GENERATED CODE - DO NOT MODIFY BY HAND');
    contentBuffer.writeln();

    if (includeContent.isNotEmpty) {
      contentBuffer.writeln(includeContent);
      contentBuffer.writeln();
    }

    contentBuffer.writeln('''
linter:
  rules:''');

    String ruleText(Rule rule) {
      const indent = '    ';
      final buffer = StringBuffer('$indent- ${rule.name}');
      if (rule.incompatibles case final incompatibles
          when incompatibles.isNotEmpty) {
        buffer.write(' # incompatibles: ${incompatibles.join(',')}');
      }
      if (rule.categories case final categories when categories.isNotEmpty) {
        buffer.write(' # categories: ${categories.join(',')}');
      }
      return buffer.toString();
    }

    final lintRuleTexts = lintRules.map((l) => ruleText(l.rule));
    contentBuffer.writeln(lintRuleTexts.join('\n'));

    outputFile.writeAsStringSync(contentBuffer.toString());
  }

  Future<void> outputRecommendedLintRules({
    required File outputFile,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
    required String includeContent,
  }) async {
    final contentBuffer = StringBuffer();
    contentBuffer.writeln('# GENERATED CODE - DO NOT MODIFY BY HAND');
    contentBuffer.writeln();

    contentBuffer.writeln(includeContent);
    contentBuffer.writeln();

    contentBuffer.writeln('''
analyzer:
  language:
    # Increase safety as much as possible.
    strict-casts: true
    strict-inference: true
    strict-raw-types: true
  errors:
    # By including all.yaml, some rules will conflict. These warnings will be addressed within this file.
    included_file_warning: ignore

    # Members annotated with `visibleForTesting` should not be referenced outside of the library in which they are declared or libraries within the test directory.
    invalid_use_of_visible_for_testing_member: error
''');

    const indent = '    ';
    final recommendedRuleSeveritiesTexts = recommendedRuleSeverities.map((l) {
      final buffer = StringBuffer();
      buffer.writeln('$indent# ${l.reason}');
      buffer.write('$indent${l.rule.name}: ${l.severityLevel.name}');
      return buffer.toString();
    }).join('\n\n');
    contentBuffer.writeln(recommendedRuleSeveritiesTexts);
    contentBuffer.writeln();

    contentBuffer.writeln('''
linter:
  rules:''');
    final disableLintRuleTexts = notRecommendedRules.map((l) {
      final buffer = StringBuffer();
      buffer.writeln('$indent# ${l.reason}');
      buffer.write('$indent${l.rule.name}: false');
      return buffer.toString();
    }).join('\n\n');

    contentBuffer.writeln(disableLintRuleTexts);
    outputFile.writeAsStringSync(contentBuffer.toString());
  }
}
