// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GitHubToken {
  String get token => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(String token) withBearerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(String token)? withBearerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(String token)? withBearerToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GitHubTokenWithToken value) withToken,
    required TResult Function(_GitHubTokenWithBearerToken value)
        withBearerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GitHubTokenWithToken value)? withToken,
    TResult? Function(_GitHubTokenWithBearerToken value)? withBearerToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GitHubTokenWithToken value)? withToken,
    TResult Function(_GitHubTokenWithBearerToken value)? withBearerToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GitHubTokenCopyWith<GitHubToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubTokenCopyWith<$Res> {
  factory $GitHubTokenCopyWith(
          GitHubToken value, $Res Function(GitHubToken) then) =
      _$GitHubTokenCopyWithImpl<$Res, GitHubToken>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$GitHubTokenCopyWithImpl<$Res, $Val extends GitHubToken>
    implements $GitHubTokenCopyWith<$Res> {
  _$GitHubTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GitHubTokenWithTokenCopyWith<$Res>
    implements $GitHubTokenCopyWith<$Res> {
  factory _$$_GitHubTokenWithTokenCopyWith(_$_GitHubTokenWithToken value,
          $Res Function(_$_GitHubTokenWithToken) then) =
      __$$_GitHubTokenWithTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_GitHubTokenWithTokenCopyWithImpl<$Res>
    extends _$GitHubTokenCopyWithImpl<$Res, _$_GitHubTokenWithToken>
    implements _$$_GitHubTokenWithTokenCopyWith<$Res> {
  __$$_GitHubTokenWithTokenCopyWithImpl(_$_GitHubTokenWithToken _value,
      $Res Function(_$_GitHubTokenWithToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_GitHubTokenWithToken(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GitHubTokenWithToken extends _GitHubTokenWithToken {
  const _$_GitHubTokenWithToken(this.token) : super._();

  @override
  final String token;

  @override
  String toString() {
    return 'GitHubToken.withToken(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GitHubTokenWithToken &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GitHubTokenWithTokenCopyWith<_$_GitHubTokenWithToken> get copyWith =>
      __$$_GitHubTokenWithTokenCopyWithImpl<_$_GitHubTokenWithToken>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(String token) withBearerToken,
  }) {
    return withToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(String token)? withBearerToken,
  }) {
    return withToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(String token)? withBearerToken,
    required TResult orElse(),
  }) {
    if (withToken != null) {
      return withToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GitHubTokenWithToken value) withToken,
    required TResult Function(_GitHubTokenWithBearerToken value)
        withBearerToken,
  }) {
    return withToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GitHubTokenWithToken value)? withToken,
    TResult? Function(_GitHubTokenWithBearerToken value)? withBearerToken,
  }) {
    return withToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GitHubTokenWithToken value)? withToken,
    TResult Function(_GitHubTokenWithBearerToken value)? withBearerToken,
    required TResult orElse(),
  }) {
    if (withToken != null) {
      return withToken(this);
    }
    return orElse();
  }
}

abstract class _GitHubTokenWithToken extends GitHubToken {
  const factory _GitHubTokenWithToken(final String token) =
      _$_GitHubTokenWithToken;
  const _GitHubTokenWithToken._() : super._();

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_GitHubTokenWithTokenCopyWith<_$_GitHubTokenWithToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GitHubTokenWithBearerTokenCopyWith<$Res>
    implements $GitHubTokenCopyWith<$Res> {
  factory _$$_GitHubTokenWithBearerTokenCopyWith(
          _$_GitHubTokenWithBearerToken value,
          $Res Function(_$_GitHubTokenWithBearerToken) then) =
      __$$_GitHubTokenWithBearerTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_GitHubTokenWithBearerTokenCopyWithImpl<$Res>
    extends _$GitHubTokenCopyWithImpl<$Res, _$_GitHubTokenWithBearerToken>
    implements _$$_GitHubTokenWithBearerTokenCopyWith<$Res> {
  __$$_GitHubTokenWithBearerTokenCopyWithImpl(
      _$_GitHubTokenWithBearerToken _value,
      $Res Function(_$_GitHubTokenWithBearerToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_GitHubTokenWithBearerToken(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GitHubTokenWithBearerToken extends _GitHubTokenWithBearerToken {
  const _$_GitHubTokenWithBearerToken(this.token) : super._();

  @override
  final String token;

  @override
  String toString() {
    return 'GitHubToken.withBearerToken(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GitHubTokenWithBearerToken &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GitHubTokenWithBearerTokenCopyWith<_$_GitHubTokenWithBearerToken>
      get copyWith => __$$_GitHubTokenWithBearerTokenCopyWithImpl<
          _$_GitHubTokenWithBearerToken>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) withToken,
    required TResult Function(String token) withBearerToken,
  }) {
    return withBearerToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? withToken,
    TResult? Function(String token)? withBearerToken,
  }) {
    return withBearerToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? withToken,
    TResult Function(String token)? withBearerToken,
    required TResult orElse(),
  }) {
    if (withBearerToken != null) {
      return withBearerToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GitHubTokenWithToken value) withToken,
    required TResult Function(_GitHubTokenWithBearerToken value)
        withBearerToken,
  }) {
    return withBearerToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GitHubTokenWithToken value)? withToken,
    TResult? Function(_GitHubTokenWithBearerToken value)? withBearerToken,
  }) {
    return withBearerToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GitHubTokenWithToken value)? withToken,
    TResult Function(_GitHubTokenWithBearerToken value)? withBearerToken,
    required TResult orElse(),
  }) {
    if (withBearerToken != null) {
      return withBearerToken(this);
    }
    return orElse();
  }
}

abstract class _GitHubTokenWithBearerToken extends GitHubToken {
  const factory _GitHubTokenWithBearerToken(final String token) =
      _$_GitHubTokenWithBearerToken;
  const _GitHubTokenWithBearerToken._() : super._();

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_GitHubTokenWithBearerTokenCopyWith<_$_GitHubTokenWithBearerToken>
      get copyWith => throw _privateConstructorUsedError;
}
