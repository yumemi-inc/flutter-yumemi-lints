// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'analysis_options_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisOptionsServiceHash() =>
    r'a9428f2541cc29a7e0f64d8d8163c8638518b80a';

/// See also [analysisOptionsService].
@ProviderFor(analysisOptionsService)
final analysisOptionsServiceProvider =
    AutoDisposeProvider<AnalysisOptionsService>.internal(
  analysisOptionsService,
  name: r'analysisOptionsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analysisOptionsServiceHash,
  dependencies: <ProviderOrFamily>[outputDirProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    outputDirProvider,
    ...?outputDirProvider.allTransitiveDependencies
  },
);

typedef AnalysisOptionsServiceRef
    = AutoDisposeProviderRef<AnalysisOptionsService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
