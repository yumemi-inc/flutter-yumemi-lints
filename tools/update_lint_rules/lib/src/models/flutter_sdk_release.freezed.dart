// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flutter_sdk_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlutterSdkRelease _$FlutterSdkReleaseFromJson(Map<String, dynamic> json) {
  return _FlutterSdkRelease.fromJson(json);
}

/// @nodoc
mixin _$FlutterSdkRelease {
  FlutterChannel get channel => throw _privateConstructorUsedError;
  @_VersionJsonConverter()
  Version get version => throw _privateConstructorUsedError;
  @_VersionJsonConverter()
  @JsonKey(name: 'dart_sdk_version')
  Version get dartSdkVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlutterSdkReleaseCopyWith<FlutterSdkRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterSdkReleaseCopyWith<$Res> {
  factory $FlutterSdkReleaseCopyWith(
          FlutterSdkRelease value, $Res Function(FlutterSdkRelease) then) =
      _$FlutterSdkReleaseCopyWithImpl<$Res, FlutterSdkRelease>;
  @useResult
  $Res call(
      {FlutterChannel channel,
      @_VersionJsonConverter() Version version,
      @_VersionJsonConverter()
      @JsonKey(name: 'dart_sdk_version')
      Version dartSdkVersion});
}

/// @nodoc
class _$FlutterSdkReleaseCopyWithImpl<$Res, $Val extends FlutterSdkRelease>
    implements $FlutterSdkReleaseCopyWith<$Res> {
  _$FlutterSdkReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? version = null,
    Object? dartSdkVersion = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FlutterChannel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
      dartSdkVersion: null == dartSdkVersion
          ? _value.dartSdkVersion
          : dartSdkVersion // ignore: cast_nullable_to_non_nullable
              as Version,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlutterSdkReleaseCopyWith<$Res>
    implements $FlutterSdkReleaseCopyWith<$Res> {
  factory _$$_FlutterSdkReleaseCopyWith(_$_FlutterSdkRelease value,
          $Res Function(_$_FlutterSdkRelease) then) =
      __$$_FlutterSdkReleaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FlutterChannel channel,
      @_VersionJsonConverter() Version version,
      @_VersionJsonConverter()
      @JsonKey(name: 'dart_sdk_version')
      Version dartSdkVersion});
}

/// @nodoc
class __$$_FlutterSdkReleaseCopyWithImpl<$Res>
    extends _$FlutterSdkReleaseCopyWithImpl<$Res, _$_FlutterSdkRelease>
    implements _$$_FlutterSdkReleaseCopyWith<$Res> {
  __$$_FlutterSdkReleaseCopyWithImpl(
      _$_FlutterSdkRelease _value, $Res Function(_$_FlutterSdkRelease) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? version = null,
    Object? dartSdkVersion = null,
  }) {
    return _then(_$_FlutterSdkRelease(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FlutterChannel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
      dartSdkVersion: null == dartSdkVersion
          ? _value.dartSdkVersion
          : dartSdkVersion // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlutterSdkRelease implements _FlutterSdkRelease {
  const _$_FlutterSdkRelease(
      {required this.channel,
      @_VersionJsonConverter() required this.version,
      @_VersionJsonConverter()
      @JsonKey(name: 'dart_sdk_version')
      required this.dartSdkVersion});

  factory _$_FlutterSdkRelease.fromJson(Map<String, dynamic> json) =>
      _$$_FlutterSdkReleaseFromJson(json);

  @override
  final FlutterChannel channel;
  @override
  @_VersionJsonConverter()
  final Version version;
  @override
  @_VersionJsonConverter()
  @JsonKey(name: 'dart_sdk_version')
  final Version dartSdkVersion;

  @override
  String toString() {
    return 'FlutterSdkRelease(channel: $channel, version: $version, dartSdkVersion: $dartSdkVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlutterSdkRelease &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.dartSdkVersion, dartSdkVersion) ||
                other.dartSdkVersion == dartSdkVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, version, dartSdkVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlutterSdkReleaseCopyWith<_$_FlutterSdkRelease> get copyWith =>
      __$$_FlutterSdkReleaseCopyWithImpl<_$_FlutterSdkRelease>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlutterSdkReleaseToJson(
      this,
    );
  }
}

abstract class _FlutterSdkRelease implements FlutterSdkRelease {
  const factory _FlutterSdkRelease(
      {required final FlutterChannel channel,
      @_VersionJsonConverter() required final Version version,
      @_VersionJsonConverter()
      @JsonKey(name: 'dart_sdk_version')
      required final Version dartSdkVersion}) = _$_FlutterSdkRelease;

  factory _FlutterSdkRelease.fromJson(Map<String, dynamic> json) =
      _$_FlutterSdkRelease.fromJson;

  @override
  FlutterChannel get channel;
  @override
  @_VersionJsonConverter()
  Version get version;
  @override
  @_VersionJsonConverter()
  @JsonKey(name: 'dart_sdk_version')
  Version get dartSdkVersion;
  @override
  @JsonKey(ignore: true)
  _$$_FlutterSdkReleaseCopyWith<_$_FlutterSdkRelease> get copyWith =>
      throw _privateConstructorUsedError;
}
