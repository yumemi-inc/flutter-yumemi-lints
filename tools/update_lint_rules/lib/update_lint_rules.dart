import 'package:riverpod/riverpod.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';

Future<ExitStatus> run(List<String> args) async {
  final container = ProviderContainer();
  final lintRuleService = container.read(lintRuleServiceProvider);

  try {
    final lintRules = await lintRuleService.getLintRules();
    print(lintRules);
    return ExitStatus.success;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  } finally {
    container.dispose();
  }
}
