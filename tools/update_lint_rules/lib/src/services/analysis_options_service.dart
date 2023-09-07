import 'package:file/file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
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
  }) async {
    final futures = releases.map((release) {
      final dartSdkVersion = release.version;
      final allLintRules = lintRules.where((lintRule) {
        final since = lintRule.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });

      final dartOutputDir = _outputDir.childDirectory('dart/$dartSdkVersion');
      final allFile = dartOutputDir.childFile('all.yaml')
        ..createSync(recursive: true);

      return outputAllLintRules(
        outputFile: allFile,
        lintRules: allLintRules,
      );
    });

    await Future.wait(futures);
  }

  Future<void> updateFlutterLintRule({
    required Iterable<FlutterSdkRelease> releases,
    required Iterable<FlutterLintRule> lintRules,
  }) async {
    final futures = releases.map((release) {
      final flutterSdkVersion = release.version;
      final dartSdkVersion = release.dartSdkVersion;
      final allLintRules = lintRules.where((lintRule) {
        final since = lintRule.rule.since;
        if (since is! SinceDartSdk) {
          return false;
        }
        return since.version <= dartSdkVersion;
      });

      final dartOutputDir =
          _outputDir.childDirectory('flutter/$flutterSdkVersion');
      final allFile = dartOutputDir.childFile('all.yaml')
        ..createSync(recursive: true);
      final includeContent =
          'include: package:yumemi_lints/dart/$dartSdkVersion/all.yaml';

      return outputAllLintRules(
        outputFile: allFile,
        lintRules: allLintRules,
        includeContent: includeContent,
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

    String? lintRuleText(Iterable<LintRule> lintRules, RuleGroup group) {
      final filteredLintRules = lintRules.where((l) => l.rule.group == group);
      if (filteredLintRules.isEmpty) {
        return null;
      }
      const indent = '    ';
      final buffer = StringBuffer();
      buffer.writeln('$indent# ${group.title}');
      final lintRuleTexts = filteredLintRules.map((l) {
        final buffer = StringBuffer('$indent- ${l.rule.name}');
        if (l.rule.incompatibles case final incompatibles
            when incompatibles.isNotEmpty) {
          buffer.write(' # incompatibles: ${incompatibles.join(',')}');
        }
        return buffer.toString();
      }).join('\n');
      buffer.write(lintRuleTexts);
      return buffer.toString();
    }

    final lintRuleTexts = [
      lintRuleText(lintRules, RuleGroup.errors),
      lintRuleText(lintRules, RuleGroup.style),
      lintRuleText(lintRules, RuleGroup.pub),
    ].nonNulls;

    if (lintRuleTexts.isNotEmpty) {
      contentBuffer.writeln(lintRuleTexts.join('\n\n'));
    }
    outputFile.writeAsStringSync(contentBuffer.toString());
  }
}

extension _RuleGroupTitle on RuleGroup {
  String get title => switch (this) {
        RuleGroup.errors => 'Errors',
        RuleGroup.style => 'Style',
        RuleGroup.pub => 'Pub',
      };
}
