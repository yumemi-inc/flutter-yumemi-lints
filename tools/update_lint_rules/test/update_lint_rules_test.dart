import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';
import 'package:update_lint_rules/src/services/sdk_service.dart';
import 'package:update_lint_rules/update_lint_rules.dart';

import 'fakes/services/fake_lint_rule_service.dart';
import 'fakes/services/fake_sdk_service.dart';

void main() {
  test('updateLintRules', () async {
    final container = ProviderContainer(
      overrides: [
        lintRuleServiceProvider.overrideWithValue(FakeLintRuleService()),
        sdkServiceProvider.overrideWithValue(FakeSdkService()),
      ],
    );
    addTearDown(container.dispose);

    final status = await updateLintRules(container);

    expect(status, ExitStatus.success);
  });
}
