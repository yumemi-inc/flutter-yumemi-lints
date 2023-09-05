import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/services/analysis_options_service.dart';

class FakeAnalysisOptionsService implements AnalysisOptionsService {
  @override
  Future<void> updateDartLintRules({
    required Iterable<DartSdkRelease> releases,
    required Iterable<DartLintRule> lintRules,
  }) async {}

  @override
  Future<void> updateFlutterLintRule({
    required Iterable<FlutterSdkRelease> releases,
    required Iterable<FlutterLintRule> lintRules,
  }) async {}
}
