// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_sdk_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DartSdkRelease {
  Version get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DartSdkReleaseCopyWith<DartSdkRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DartSdkReleaseCopyWith<$Res> {
  factory $DartSdkReleaseCopyWith(
          DartSdkRelease value, $Res Function(DartSdkRelease) then) =
      _$DartSdkReleaseCopyWithImpl<$Res, DartSdkRelease>;
  @useResult
  $Res call({Version version});
}

/// @nodoc
class _$DartSdkReleaseCopyWithImpl<$Res, $Val extends DartSdkRelease>
    implements $DartSdkReleaseCopyWith<$Res> {
  _$DartSdkReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DartSdkReleaseCopyWith<$Res>
    implements $DartSdkReleaseCopyWith<$Res> {
  factory _$$_DartSdkReleaseCopyWith(
          _$_DartSdkRelease value, $Res Function(_$_DartSdkRelease) then) =
      __$$_DartSdkReleaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Version version});
}

/// @nodoc
class __$$_DartSdkReleaseCopyWithImpl<$Res>
    extends _$DartSdkReleaseCopyWithImpl<$Res, _$_DartSdkRelease>
    implements _$$_DartSdkReleaseCopyWith<$Res> {
  __$$_DartSdkReleaseCopyWithImpl(
      _$_DartSdkRelease _value, $Res Function(_$_DartSdkRelease) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$_DartSdkRelease(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc

class _$_DartSdkRelease implements _DartSdkRelease {
  const _$_DartSdkRelease({required this.version});

  @override
  final Version version;

  @override
  String toString() {
    return 'DartSdkRelease(version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DartSdkRelease &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DartSdkReleaseCopyWith<_$_DartSdkRelease> get copyWith =>
      __$$_DartSdkReleaseCopyWithImpl<_$_DartSdkRelease>(this, _$identity);
}

abstract class _DartSdkRelease implements DartSdkRelease {
  const factory _DartSdkRelease({required final Version version}) =
      _$_DartSdkRelease;

  @override
  Version get version;
  @override
  @JsonKey(ignore: true)
  _$$_DartSdkReleaseCopyWith<_$_DartSdkRelease> get copyWith =>
      throw _privateConstructorUsedError;
}
