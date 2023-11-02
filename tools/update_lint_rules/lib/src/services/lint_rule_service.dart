import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/clients/app_client.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/models/not_recommended_rule.dart';

part 'lint_rule_service.g.dart';

@Riverpod(dependencies: [appClient])
LintRuleService lintRuleService(LintRuleServiceRef ref) {
  final appClient = ref.watch(appClientProvider);
  return LintRuleService(
    appClient: appClient,
  );
}

//　Lint rules not recommended by YUMEMI Inc.
const _yumemiNotRecommendedRules = <({String name, String reason})>[
  (
    name: 'always_specify_types',
    reason:
        'Conflicts with enabling `avoid_types_on_closure_parameters`, `omit_local_variable_types`.',
  ),
  (
    name: 'avoid_annotating_with_dynamic',
    reason: 'Conflicts with enabling `strict-raw-types`.',
  ),
  (
    name: 'cascade_invocations',
    reason: 'There are cases that are warned but not fixed by `dart fix`.',
  ),
  (
    name: 'flutter_style_todos',
    reason: "Don't use Flutter-style todos.",
  ),
  (
    name: 'one_member_abstracts',
    reason: 'May add more methods later.',
  ),
  (
    name: 'prefer_double_quotes',
    reason: 'Conflicts with enabling `prefer_single_quotes`.',
  ),
  (
    name: 'prefer_expression_function_bodies',
    reason: 'Using `=>` has sometimes to reduce readability.',
  ),
  (
    name: 'prefer_final_parameters',
    reason: 'Conflicts with enabling `avoid_final_parameters`.',
  ),
  (
    name: 'prefer_relative_imports',
    reason: 'Conflicts with enabling `always_use_package_imports`.',
  ),
  (
    name: 'public_member_api_docs',
    reason: "Don't often develop package.",
  ),
  (
    name: 'unnecessary_final',
    reason: 'Conflicts with enabling `prefer_final_locals`.',
  ),
];

class LintRuleService {
  LintRuleService({
    required AppClient appClient,
  }) : _appClient = appClient;

  final AppClient _appClient;
  Iterable<Rule>? _cacheAllRules;

  Future<LintRules> getLintRules() async {
    final allRules = await getRules();
    final allLintRules = allRules.map((rule) {
      if (rule.isFlutterOnly) {
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

  Future<NotRecommendedRules> getNotRecommendedRules() async {
    final allRules = await getRules();

    final notReccomendedAllRules =
        _yumemiNotRecommendedRules.map((notRecommendedRule) {
      final rule = allRules.firstWhereOrNull(
        (rule) => notRecommendedRule.name == rule.name,
      );
      if (rule == null) {
        return null;
      }

      if (rule.isFlutterOnly) {
        return NotRecommendedRule.flutter(
            rule: rule, reason: notRecommendedRule.reason);
      } else {
        return NotRecommendedRule.dart(
            rule: rule, reason: notRecommendedRule.reason);
      }
    });
    return (
      flutter: notReccomendedAllRules.whereType<NotRecommendedFlutterRule>(),
      dart: notReccomendedAllRules.whereType<NotRecommendedDartRule>()
    );
  }

  @visibleForTesting
  Future<Iterable<Rule>> getRules() async {
    final cacheAllRules = _cacheAllRules;
    if (cacheAllRules != null) {
      return cacheAllRules;
    }

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
    return _cacheAllRules = rules;
  }
}
