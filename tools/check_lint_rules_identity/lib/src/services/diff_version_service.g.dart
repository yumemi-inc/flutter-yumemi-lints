// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'diff_version_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diffVersionServiceHash() =>
    r'f71b21a98c422140dd887694c5397b3dae6b1cdc';

/// See also [diffVersionService].
@ProviderFor(diffVersionService)
final diffVersionServiceProvider =
    AutoDisposeProvider<DiffVersionService>.internal(
  diffVersionService,
  name: r'diffVersionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$diffVersionServiceHash,
  dependencies: <ProviderOrFamily>[versionPathsFileProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    versionPathsFileProvider,
    ...?versionPathsFileProvider.allTransitiveDependencies
  },
);

typedef DiffVersionServiceRef = AutoDisposeProviderRef<DiffVersionService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
