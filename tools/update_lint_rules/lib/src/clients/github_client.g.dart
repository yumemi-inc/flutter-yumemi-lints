// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'github_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gitHubTokenHash() => r'f23013ca01f97f13965fc03146205a2b642d664d';

/// See also [gitHubToken].
@ProviderFor(gitHubToken)
final gitHubTokenProvider = Provider<GitHubToken>.internal(
  gitHubToken,
  name: r'gitHubTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gitHubTokenHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef GitHubTokenRef = ProviderRef<GitHubToken>;
String _$gitHubClientHash() => r'73ae2204fcdcfc52a813ab29ec976dafff53a8e5';

/// See also [gitHubClient].
@ProviderFor(gitHubClient)
final gitHubClientProvider = Provider<GitHubClient>.internal(
  gitHubClient,
  name: r'gitHubClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gitHubClientHash,
  dependencies: <ProviderOrFamily>[gitHubTokenProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    gitHubTokenProvider,
    ...?gitHubTokenProvider.allTransitiveDependencies
  },
);

typedef GitHubClientRef = ProviderRef<GitHubClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
