import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';

part 'not_recommended_rule.freezed.dart';

typedef NotRecommendedRules = ({
  Iterable<NotRecommendedDartRule> dart,
  Iterable<NotRecommendedFlutterRule> flutter,
});

@freezed
sealed class NotRecommendedRule with _$NotRecommendedRule {
  const factory NotRecommendedRule.dart({
    required Rule rule,
    required String reason,
  }) = NotRecommendedDartRule;
  const factory NotRecommendedRule.flutter({
    required Rule rule,
    required String reason,
  }) = NotRecommendedFlutterRule;
}
