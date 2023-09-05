import 'package:file/file.dart';
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
  }) async {}

  Future<void> updateFlutterLintRule({
    required Iterable<FlutterSdkRelease> releases,
    required Iterable<FlutterLintRule> lintRules,
  }) async {}
}
