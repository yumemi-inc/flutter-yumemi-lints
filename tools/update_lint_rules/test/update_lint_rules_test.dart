import 'package:file/memory.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';
import 'package:update_lint_rules/src/models/exit_status.dart';
import 'package:update_lint_rules/src/output_dir.dart';
import 'package:update_lint_rules/src/services/analysis_options_service.dart';
import 'package:update_lint_rules/src/services/lint_rule_service.dart';
import 'package:update_lint_rules/src/services/sdk_service.dart';
import 'package:update_lint_rules/update_lint_rules.dart';

import 'fakes/services/fake_analysis_options_service.dart';
import 'fakes/services/fake_lint_rule_service.dart';
import 'fakes/services/fake_sdk_service.dart';

void main() {
  test('updateLintRules', () async {
    final fileSystem = MemoryFileSystem();
    final outputDir = fileSystem.systemTempDirectory.childDirectory('build');

    final container = ProviderContainer(
      overrides: [
        outputDirProvider.overrideWithValue(outputDir),
        lintRuleServiceProvider.overrideWithValue(FakeLintRuleService()),
        sdkServiceProvider.overrideWithValue(FakeSdkService()),
        analysisOptionsServiceProvider
            .overrideWithValue(FakeAnalysisOptionsService()),
      ],
    );
    addTearDown(container.dispose);

    final status = await updateLintRules(container);

    expect(status, ExitStatus.success);
  });
}
