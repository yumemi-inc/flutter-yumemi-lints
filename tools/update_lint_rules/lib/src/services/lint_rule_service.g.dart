// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'lint_rule_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lintRuleServiceHash() => r'61139ae5288d244c639c1c73b97a0773a2572dc4';

/// See also [lintRuleService].
@ProviderFor(lintRuleService)
final lintRuleServiceProvider = AutoDisposeProvider<LintRuleService>.internal(
  lintRuleService,
  name: r'lintRuleServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lintRuleServiceHash,
  dependencies: <ProviderOrFamily>[appClientProvider, gitHubClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    appClientProvider,
    ...?appClientProvider.allTransitiveDependencies,
    gitHubClientProvider,
    ...?gitHubClientProvider.allTransitiveDependencies
  },
);

typedef LintRuleServiceRef = AutoDisposeProviderRef<LintRuleService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
