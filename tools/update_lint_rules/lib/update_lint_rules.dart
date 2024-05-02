import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/output_dir.dart';
import 'package:update_lint_rules/src/services/analysis_options_service.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';
import 'package:update_lint_rules/src/services/sdk_service.dart';

Future<ExitStatus> run(List<String> args) async {
  final outputDirPath = args.firstOrNull;

  final fileSystem = LocalFileSystem();
  final Directory outputDir;
  if (outputDirPath == null) {
    outputDir = fileSystem.currentDirectory.childDirectory('build');
  } else {
    if (!fileSystem.isDirectorySync(outputDirPath)) {
      throw FormatException(
        'The input value must be a valid path to an existing directory.',
      );
    }
    outputDir = fileSystem.directory(outputDirPath);
  }

  final container = ProviderContainer(
    overrides: [
      outputDirProvider.overrideWithValue(outputDir),
    ],
  );
  try {
    final exitStatus = await updateLintRules(container);
    return exitStatus;
  } finally {
    container.dispose();
  }
}

@visibleForTesting
Future<ExitStatus> updateLintRules(ProviderContainer container) async {
  final lintRuleService = container.read(lintRuleServiceProvider);
  final sdkService = container.read(sdkServiceProvider);
  final analysisOptionsService = container.read(analysisOptionsServiceProvider);

  try {
    final lintRules = await lintRuleService.getLintRules();
    final notRecommendedRules = await lintRuleService.getNotRecommendedRules();
    final recommendedRuleSeverities =
        await lintRuleService.getRecommendedRuleSeverities();

    final dartSdkReleases = await sdkService.getDartSdkReleases();
    await analysisOptionsService.updateDartLintRules(
      releases: dartSdkReleases,
      lintRules: lintRules.dart,
      notRecommendedRules: notRecommendedRules.dart,
      recommendedRuleSeverities: recommendedRuleSeverities.dart,
    );

    final flutterSdkReleases = await sdkService.getFlutterSdkReleases();
    await analysisOptionsService.updateFlutterLintRule(
      releases: flutterSdkReleases,
      lintRules: lintRules.flutter,
      notRecommendedRules: [
        ...notRecommendedRules.dart,
        ...notRecommendedRules.flutter,
      ],
      recommendedRuleSeverities: [
        ...recommendedRuleSeverities.dart,
        ...recommendedRuleSeverities.flutter,
      ],
    );

    return ExitStatus.success;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  }
}
