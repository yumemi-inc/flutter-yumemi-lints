import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';

part 'not_recommended_rule.freezed.dart';

@freezed
class NotRecommendedRule with _$NotRecommendedRule {
  const factory NotRecommendedRule({
    required Rule rule,
    required String reason,
  }) = _NotRecommendedRule;
}
