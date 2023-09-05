import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';

class FakeLintRuleService implements LintRuleService {
  @override
  Future<LintRules> getLintRules() async {
    return (dart: <DartLintRule>[], flutter: <FlutterLintRule>[]);
  }

  @override
  Future<Iterable<Rule>> getRules() async {
    return [];
  }
}
