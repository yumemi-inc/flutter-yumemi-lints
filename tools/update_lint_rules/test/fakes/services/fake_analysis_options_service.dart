import 'package:file/src/interface/file.dart';
import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/models/not_recommended_rule.dart';
import 'package:update_lint_rules/src/models/recommended_rule_severity.dart';
import 'package:update_lint_rules/src/services/analysis_options_service.dart';

class FakeAnalysisOptionsService implements AnalysisOptionsService {
  @override
  Future<void> updateDartLintRules({
    required Iterable<DartSdkRelease> releases,
    required Iterable<DartLintRule> lintRules,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
  }) async {}

  @override
  Future<void> updateFlutterLintRule({
    required Iterable<FlutterSdkRelease> releases,
    required Iterable<FlutterLintRule> lintRules,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
  }) async {}

  @override
  Future<void> outputAllLintRules({
    required File outputFile,
    required Iterable<LintRule> lintRules,
    String includeContent = '',
  }) async {}

  @override
  Future<void> outputRecommendedLintRules({
    required File outputFile,
    required Iterable<NotRecommendedRule> notRecommendedRules,
    required Iterable<RecommendedRuleSeverity> recommendedRuleSeverities,
    required String includeContent,
  }) async {}
}
