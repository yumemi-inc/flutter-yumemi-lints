// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'sdk_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sdkServiceHash() => r'430041398e0b0082d7b6dfd8b6ec9ef1440ca8a0';

/// See also [sdkService].
@ProviderFor(sdkService)
final sdkServiceProvider = AutoDisposeProvider<SdkService>.internal(
  sdkService,
  name: r'sdkServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sdkServiceHash,
  dependencies: <ProviderOrFamily>[appClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    appClientProvider,
    ...?appClientProvider.allTransitiveDependencies
  },
);

typedef SdkServiceRef = AutoDisposeProviderRef<SdkService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
