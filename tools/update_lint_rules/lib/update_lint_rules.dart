import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';
import 'package:update_lint_rules/src/services/sdk_service.dart';

Future<ExitStatus> run(List<String> args) async {
  final container = ProviderContainer();
  try {
    final exitStatus = await updateLintRules(container);
    return exitStatus;
  } finally {
    container.dispose();
  }
}

@visibleForTesting
Future<ExitStatus> updateLintRules(ProviderContainer container) async {
  final lintRuleService = container.read(lintRuleServiceProvider);
  final sdkService = container.read(sdkServiceProvider);

  try {
    final lintRules = await lintRuleService.getLintRules();
    print(lintRules);

    final dartSdkReleases = await sdkService.getDartSdkReleases();
    print(dartSdkReleases);

    return ExitStatus.success;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  }
}
