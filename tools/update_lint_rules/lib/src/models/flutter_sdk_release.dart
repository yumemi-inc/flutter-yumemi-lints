import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'flutter_sdk_release.freezed.dart';
part 'flutter_sdk_release.g.dart';

@freezed
class FlutterSdkRelease with _$FlutterSdkRelease {
  const factory FlutterSdkRelease({
    required FlutterChannel channel,
    @_VersionJsonConverter() required Version version,
    @_VersionJsonConverter()
    @JsonKey(name: 'dart_sdk_version')
    required Version dartSdkVersion,
  }) = _FlutterSdkRelease;

  factory FlutterSdkRelease.fromJson(Map<String, dynamic> json) =>
      _$FlutterSdkReleaseFromJson(json);
}

enum FlutterChannel {
  dev,
  beta,
  stable,
}

class _VersionJsonConverter implements JsonConverter<Version, String> {
  const _VersionJsonConverter();

  @override
  Version fromJson(String value) => Version.parse(value);

  @override
  String toJson(Version version) => version.toString();
}
