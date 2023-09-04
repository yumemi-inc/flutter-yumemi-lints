import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';

Future<ExitStatus> run(List<String> args) async {
  final container = ProviderContainer();
  try {
    return updateLintRules(container);
  } finally {
    container.dispose();
  }
}

@visibleForTesting
Future<ExitStatus> updateLintRules(ProviderContainer container) async {
  final lintRuleService = container.read(lintRuleServiceProvider);

  try {
    final allLintRules = await lintRuleService.getAllLintRules();
    print(allLintRules);
    return ExitStatus.success;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  }
}
