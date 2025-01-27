import 'dart:convert';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/clients/app_client.dart';
import 'package:update_lint_rules/src/models/lint_rule.dart';
import 'package:update_lint_rules/src/models/not_recommended_rule.dart';
import 'package:update_lint_rules/src/models/recommended_rule_severity.dart';
import 'package:update_lint_rules/src/models/severity_level.dart';

part 'lint_rule_service.g.dart';

@Riverpod(dependencies: [appClient])
LintRuleService lintRuleService(LintRuleServiceRef ref) {
  final appClient = ref.watch(appClientProvider);
  return LintRuleService(
    appClient: appClient,
  );
}

class LintRuleService {
  LintRuleService({
    required AppClient appClient,
  }) : _appClient = appClient;

  final AppClient _appClient;

  Future<LintRules> getLintRules() async {
    final allRules = await getRules();
    final allLintRules = await Future.wait(
      allRules.map((rule) async {
        final isFlutterOnly = await isFlutterOnlyRule(rule);
        if (isFlutterOnly) {
          return LintRule.flutter(rule);
        } else {
          return LintRule.dart(rule);
        }
      }),
    );

    return (
      dart: allLintRules.whereType<DartLintRule>(),
      flutter: allLintRules.whereType<FlutterLintRule>(),
    );
  }

  Future<NotRecommendedRules> getNotRecommendedRules() async {
    final allRules = await getRules();

    final notRecommendedAllRules = await Future.wait(
      _yumemiNotRecommendedRules.map((notRecommendedRule) async {
        final rule = allRules.firstWhereOrNull(
          (rule) => notRecommendedRule.name == rule.name,
        );
        if (rule == null) {
          return null;
        }

        final isFlutterOnly = await isFlutterOnlyRule(rule);
        if (isFlutterOnly) {
          return NotRecommendedRule.flutter(
              rule: rule, reason: notRecommendedRule.reason);
        } else {
          return NotRecommendedRule.dart(
              rule: rule, reason: notRecommendedRule.reason);
        }
      }),
    );
    return (
      flutter: notRecommendedAllRules.whereType<NotRecommendedFlutterRule>(),
      dart: notRecommendedAllRules.whereType<NotRecommendedDartRule>()
    );
  }

  Future<RecommendedRuleSeverities> getRecommendedRuleSeverities() async {
    final allRules = await getRules();

    final recommendedRuleSeverities = await Future.wait(
      _yumemiRecommendedRuleSeverities.map(
        (lintRuleRecommendedSeverity) async {
          final rule = allRules.firstWhereOrNull(
            (rule) => lintRuleRecommendedSeverity.name == rule.name,
          );
          if (rule == null) {
            return null;
          }

          final reason = lintRuleRecommendedSeverity.reason;
          final severityLevel = lintRuleRecommendedSeverity.severityLevel;

          final isFlutterOnly = await isFlutterOnlyRule(rule);
          if (isFlutterOnly) {
            return RecommendedRuleSeverity.flutter(
              rule: rule,
              reason: reason,
              severityLevel: severityLevel,
            );
          } else {
            return RecommendedRuleSeverity.dart(
              rule: rule,
              reason: reason,
              severityLevel: severityLevel,
            );
          }
        },
      ),
    );
    return (
      dart: recommendedRuleSeverities.whereType<RecommendedRuleSeverityDart>(),
      flutter:
          recommendedRuleSeverities.whereType<RecommendedRuleSeverityFlutter>(),
    );
  }

  final _allRulesMemo = AsyncMemoizer<Iterable<Rule>>();

  @visibleForTesting
  Future<Iterable<Rule>> getRules() => _allRulesMemo.runOnce(
        () async {
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
        },
      );

  Future<bool> isFlutterOnlyRule(Rule rule) async {
    if (_isNotFlutterOnlyRules.contains(rule.name)) {
      return false;
    }

    final url = Uri.https(
      'raw.githubusercontent.com',
      'dart-lang/sdk/main/pkg/linter/lib/src/rules/${rule.name}.dart',
    );

    try {
      final responseBody = await _appClient.read(url);
      return responseBody.contains('flutter');
    } on ClientException {
      return false;
    }
  }
}

/// NOTE:
///   The current implementation of `isFlutterOnlyRule()` cannot accurately
///   determine if a rule is a Flutter-only rule, so as a workaround, it keeps
///   a list of rule names that cannot be accurately determined.
const _isNotFlutterOnlyRules = [
  'avoid_print',
  'always_put_control_body_on_new_line',
  'always_specify_types',
  'flutter_style_todos',
];

typedef _NotRecommendedRule = ({
  String name,
  String reason,
});

///　Rules not recommended by YUMEMI Inc.
const _yumemiNotRecommendedRules = <_NotRecommendedRule>[
  (
    name: 'always_specify_types',
    reason:
        'Conflicts with enabling `avoid_types_on_closure_parameters`, `omit_local_variable_types`, `omit_obvious_local_variable_types`, `omit_obvious_property_types`.',
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
    name: 'specify_nonobvious_local_variable_types',
    reason: 'Conflicts with enabling `omit_local_variable_types`.',
  ),
  (
    name: 'unnecessary_final',
    reason: 'Conflicts with enabling `prefer_final_locals`.',
  ),
  (
    name: 'use_setters_to_change_properties',
    reason:
        "Don't trigger warnings with methods for simple state updates, among other things.",
  ),
];

typedef _RecommendedRuleSeverity = ({
  String name,
  String reason,
  SeverityLevel severityLevel,
});

/// Severity levels of rule recommended by YUMEMI Inc.
const _yumemiRecommendedRuleSeverities = <_RecommendedRuleSeverity>[
  (
    name: 'annotate_overrides',
    reason:
        'Superclass members should not be unintentionally overridden, as this reduces readability.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'annotate_redeclares',
    reason:
        'Class members should not be unintentionally redeclared, as this reduces readability.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'avoid_implementing_value_types',
    reason:
        'When using implements, you do not inherit the method body of `==`, making it nearly impossible to follow the contract of `==`.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'avoid_renaming_method_parameters',
    reason:
        "Parameter names in overridden methods that do not match the original method's parameter names are usually considered typos.",
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'avoid_shadowing_type_parameters',
    reason:
        'Shadowing type parameters should not be used, as this reduces readability.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'conditional_uri_does_not_exist',
    reason:
        'Should not reference files that do not exist for conditional imports, as this will result in possible runtime failures.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'depend_on_referenced_packages',
    reason:
        'When importing a package, add it as a dependency in pubspec to impose constraints on the dependency, protecting against breaking changes.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'file_names',
    reason:
        'Some file systems are not case-sensitive, so many projects require filenames to be all lowercase.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'implementation_imports',
    reason:
        "Files in the package's lib/src directory are not public APIs and should not be imported.",
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'library_names',
    reason:
        'Some file systems are not case-sensitive, so many projects require filenames to be all lowercase.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'matching_super_parameters',
    reason:
        'Super parameter names that do not match the parameter name of the corresponding super constructor are usually considered typos.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'null_check_on_nullable_type_parameter',
    reason:
        'When unwrapping to a generic type parameter T, using `x!` can lead to a runtime error if T is given a nullable type, so you should use `x as T` instead.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'package_names',
    reason:
        'If package names are not determined according to the rules, unexpected problems may occur.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'recursive_getters',
    reason: 'Recursive getters are usually considered typos.',
    severityLevel: SeverityLevel.error,
  ),
  (
    name: 'void_checks',
    reason: 'Should not be assigned to `void`.',
    severityLevel: SeverityLevel.error,
  ),
];
