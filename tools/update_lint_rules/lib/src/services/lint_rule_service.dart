import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/clients/app_client.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';

part 'lint_rule_service.g.dart';

@Riverpod(dependencies: [appClient])
LintRuleService lintRuleService(LintRuleServiceRef ref) {
  final appClient = ref.watch(appClientProvider);
  return LintRuleService(
    appClient: appClient,
  );
}

class LintRuleService {
  const LintRuleService({
    required AppClient appClient,
  }) : _appClient = appClient;

  final AppClient _appClient;

  Future<LintRules> getLintRules() async {
    final allRules = await getRules();
    final allLintRules = allRules.map((rule) {
      if (rule.sets case final sets
          when sets.length == 1 && sets.first == RuleSet.flutter) {
        return LintRule.flutter(rule);
      } else {
        return LintRule.dart(rule);
      }
    });

    return (
      dart: allLintRules.whereType<DartLintRule>(),
      flutter: allLintRules.whereType<FlutterLintRule>(),
    );
  }

  @visibleForTesting
  Future<Iterable<Rule>> getRules() async {
    final url = Uri.https(
      'raw.githubusercontent.com',
      'dart-lang/sdk/main/pkg/linter/tool/machine/rules.json',
    );

    final responseBody = await _appClient.read(url);

    final json = jsonDecode(responseBody) as List<dynamic>;

    final rules = json.map((e) => Rule.fromJson(e)).where(
          (e) => switch (e.state) {
            RuleState.stable || RuleState.experimental => true,
            RuleState.deprecated || RuleState.removed => false,
          },
        );
    return rules;
  }
}
