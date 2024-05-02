import 'package:update_lint_rules/src/models/severity_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';

part 'recommended_rule_severity.freezed.dart';

typedef RecommendedRuleSeverities = ({
  Iterable<RecommendedRuleSeverityDart> dart,
  Iterable<RecommendedRuleSeverityFlutter> flutter,
});

@freezed
sealed class RecommendedRuleSeverity with _$RecommendedRuleSeverity {
  const factory RecommendedRuleSeverity.dart({
    required Rule rule,
    required String reason,
    required SeverityLevel severityLevel,
  }) = RecommendedRuleSeverityDart;
  const factory RecommendedRuleSeverity.flutter({
    required Rule rule,
    required String reason,
    required SeverityLevel severityLevel,
  }) = RecommendedRuleSeverityFlutter;
}
