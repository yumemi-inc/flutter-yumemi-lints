import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';

class FakeLintRuleService implements LintRuleService {
  @override
  Future<Iterable<LintRule>> getAllLintRules() async {
    return [];
  }
}
