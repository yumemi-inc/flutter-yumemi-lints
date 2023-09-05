// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lint_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LintRule _$LintRuleFromJson(Map<String, dynamic> json) {
  return _LintRule.fromJson(json);
}

/// @nodoc
mixin _$LintRule {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RuleGroup get group => throw _privateConstructorUsedError;
  RuleState get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'incompatible')
  List<String> get incompatibles => throw _privateConstructorUsedError;
  List<RuleSet> get sets => throw _privateConstructorUsedError;
  FixStatus get fixStatus => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  @JsonKey(name: 'sinceDartSdk')
  Since get since => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LintRuleCopyWith<LintRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LintRuleCopyWith<$Res> {
  factory $LintRuleCopyWith(LintRule value, $Res Function(LintRule) then) =
      _$LintRuleCopyWithImpl<$Res, LintRule>;
  @useResult
  $Res call(
      {String name,
      String description,
      RuleGroup group,
      RuleState state,
      @JsonKey(name: 'incompatible') List<String> incompatibles,
      List<RuleSet> sets,
      FixStatus fixStatus,
      String details,
      @JsonKey(name: 'sinceDartSdk') Since since});

  $SinceCopyWith<$Res> get since;
}

/// @nodoc
class _$LintRuleCopyWithImpl<$Res, $Val extends LintRule>
    implements $LintRuleCopyWith<$Res> {
  _$LintRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? group = null,
    Object? state = null,
    Object? incompatibles = null,
    Object? sets = null,
    Object? fixStatus = null,
    Object? details = null,
    Object? since = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as RuleGroup,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RuleState,
      incompatibles: null == incompatibles
          ? _value.incompatibles
          : incompatibles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<RuleSet>,
      fixStatus: null == fixStatus
          ? _value.fixStatus
          : fixStatus // ignore: cast_nullable_to_non_nullable
              as FixStatus,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as Since,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SinceCopyWith<$Res> get since {
    return $SinceCopyWith<$Res>(_value.since, (value) {
      return _then(_value.copyWith(since: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LintRuleCopyWith<$Res> implements $LintRuleCopyWith<$Res> {
  factory _$$_LintRuleCopyWith(
          _$_LintRule value, $Res Function(_$_LintRule) then) =
      __$$_LintRuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      RuleGroup group,
      RuleState state,
      @JsonKey(name: 'incompatible') List<String> incompatibles,
      List<RuleSet> sets,
      FixStatus fixStatus,
      String details,
      @JsonKey(name: 'sinceDartSdk') Since since});

  @override
  $SinceCopyWith<$Res> get since;
}

/// @nodoc
class __$$_LintRuleCopyWithImpl<$Res>
    extends _$LintRuleCopyWithImpl<$Res, _$_LintRule>
    implements _$$_LintRuleCopyWith<$Res> {
  __$$_LintRuleCopyWithImpl(
      _$_LintRule _value, $Res Function(_$_LintRule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? group = null,
    Object? state = null,
    Object? incompatibles = null,
    Object? sets = null,
    Object? fixStatus = null,
    Object? details = null,
    Object? since = null,
  }) {
    return _then(_$_LintRule(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as RuleGroup,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RuleState,
      incompatibles: null == incompatibles
          ? _value._incompatibles
          : incompatibles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<RuleSet>,
      fixStatus: null == fixStatus
          ? _value.fixStatus
          : fixStatus // ignore: cast_nullable_to_non_nullable
              as FixStatus,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      since: null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as Since,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LintRule implements _LintRule {
  const _$_LintRule(
      {required this.name,
      required this.description,
      required this.group,
      required this.state,
      @JsonKey(name: 'incompatible') required final List<String> incompatibles,
      required final List<RuleSet> sets,
      required this.fixStatus,
      required this.details,
      @JsonKey(name: 'sinceDartSdk') required this.since})
      : _incompatibles = incompatibles,
        _sets = sets;

  factory _$_LintRule.fromJson(Map<String, dynamic> json) =>
      _$$_LintRuleFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final RuleGroup group;
  @override
  final RuleState state;
  final List<String> _incompatibles;
  @override
  @JsonKey(name: 'incompatible')
  List<String> get incompatibles {
    if (_incompatibles is EqualUnmodifiableListView) return _incompatibles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incompatibles);
  }

  final List<RuleSet> _sets;
  @override
  List<RuleSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final FixStatus fixStatus;
  @override
  final String details;
  @override
  @JsonKey(name: 'sinceDartSdk')
  final Since since;

  @override
  String toString() {
    return 'LintRule(name: $name, description: $description, group: $group, state: $state, incompatibles: $incompatibles, sets: $sets, fixStatus: $fixStatus, details: $details, since: $since)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LintRule &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._incompatibles, _incompatibles) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.fixStatus, fixStatus) ||
                other.fixStatus == fixStatus) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.since, since) || other.since == since));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      group,
      state,
      const DeepCollectionEquality().hash(_incompatibles),
      const DeepCollectionEquality().hash(_sets),
      fixStatus,
      details,
      since);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LintRuleCopyWith<_$_LintRule> get copyWith =>
      __$$_LintRuleCopyWithImpl<_$_LintRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LintRuleToJson(
      this,
    );
  }
}

abstract class _LintRule implements LintRule {
  const factory _LintRule(
      {required final String name,
      required final String description,
      required final RuleGroup group,
      required final RuleState state,
      @JsonKey(name: 'incompatible') required final List<String> incompatibles,
      required final List<RuleSet> sets,
      required final FixStatus fixStatus,
      required final String details,
      @JsonKey(name: 'sinceDartSdk') required final Since since}) = _$_LintRule;

  factory _LintRule.fromJson(Map<String, dynamic> json) = _$_LintRule.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  RuleGroup get group;
  @override
  RuleState get state;
  @override
  @JsonKey(name: 'incompatible')
  List<String> get incompatibles;
  @override
  List<RuleSet> get sets;
  @override
  FixStatus get fixStatus;
  @override
  String get details;
  @override
  @JsonKey(name: 'sinceDartSdk')
  Since get since;
  @override
  @JsonKey(ignore: true)
  _$$_LintRuleCopyWith<_$_LintRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Since {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Version version) dartSdk,
    required TResult Function() unreleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Version version)? dartSdk,
    TResult? Function()? unreleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Version version)? dartSdk,
    TResult Function()? unreleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SinceDartSdk value) dartSdk,
    required TResult Function(SinceUnreleased value) unreleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SinceDartSdk value)? dartSdk,
    TResult? Function(SinceUnreleased value)? unreleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SinceDartSdk value)? dartSdk,
    TResult Function(SinceUnreleased value)? unreleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SinceCopyWith<$Res> {
  factory $SinceCopyWith(Since value, $Res Function(Since) then) =
      _$SinceCopyWithImpl<$Res, Since>;
}

/// @nodoc
class _$SinceCopyWithImpl<$Res, $Val extends Since>
    implements $SinceCopyWith<$Res> {
  _$SinceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SinceDartSdkCopyWith<$Res> {
  factory _$$SinceDartSdkCopyWith(
          _$SinceDartSdk value, $Res Function(_$SinceDartSdk) then) =
      __$$SinceDartSdkCopyWithImpl<$Res>;
  @useResult
  $Res call({Version version});
}

/// @nodoc
class __$$SinceDartSdkCopyWithImpl<$Res>
    extends _$SinceCopyWithImpl<$Res, _$SinceDartSdk>
    implements _$$SinceDartSdkCopyWith<$Res> {
  __$$SinceDartSdkCopyWithImpl(
      _$SinceDartSdk _value, $Res Function(_$SinceDartSdk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$SinceDartSdk(
      null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc

class _$SinceDartSdk extends SinceDartSdk {
  const _$SinceDartSdk(this.version) : super._();

  @override
  final Version version;

  @override
  String toString() {
    return 'Since.dartSdk(version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SinceDartSdk &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SinceDartSdkCopyWith<_$SinceDartSdk> get copyWith =>
      __$$SinceDartSdkCopyWithImpl<_$SinceDartSdk>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Version version) dartSdk,
    required TResult Function() unreleased,
  }) {
    return dartSdk(version);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Version version)? dartSdk,
    TResult? Function()? unreleased,
  }) {
    return dartSdk?.call(version);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Version version)? dartSdk,
    TResult Function()? unreleased,
    required TResult orElse(),
  }) {
    if (dartSdk != null) {
      return dartSdk(version);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SinceDartSdk value) dartSdk,
    required TResult Function(SinceUnreleased value) unreleased,
  }) {
    return dartSdk(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SinceDartSdk value)? dartSdk,
    TResult? Function(SinceUnreleased value)? unreleased,
  }) {
    return dartSdk?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SinceDartSdk value)? dartSdk,
    TResult Function(SinceUnreleased value)? unreleased,
    required TResult orElse(),
  }) {
    if (dartSdk != null) {
      return dartSdk(this);
    }
    return orElse();
  }
}

abstract class SinceDartSdk extends Since {
  const factory SinceDartSdk(final Version version) = _$SinceDartSdk;
  const SinceDartSdk._() : super._();

  Version get version;
  @JsonKey(ignore: true)
  _$$SinceDartSdkCopyWith<_$SinceDartSdk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SinceUnreleasedCopyWith<$Res> {
  factory _$$SinceUnreleasedCopyWith(
          _$SinceUnreleased value, $Res Function(_$SinceUnreleased) then) =
      __$$SinceUnreleasedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SinceUnreleasedCopyWithImpl<$Res>
    extends _$SinceCopyWithImpl<$Res, _$SinceUnreleased>
    implements _$$SinceUnreleasedCopyWith<$Res> {
  __$$SinceUnreleasedCopyWithImpl(
      _$SinceUnreleased _value, $Res Function(_$SinceUnreleased) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SinceUnreleased extends SinceUnreleased {
  const _$SinceUnreleased() : super._();

  @override
  String toString() {
    return 'Since.unreleased()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SinceUnreleased);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Version version) dartSdk,
    required TResult Function() unreleased,
  }) {
    return unreleased();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Version version)? dartSdk,
    TResult? Function()? unreleased,
  }) {
    return unreleased?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Version version)? dartSdk,
    TResult Function()? unreleased,
    required TResult orElse(),
  }) {
    if (unreleased != null) {
      return unreleased();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SinceDartSdk value) dartSdk,
    required TResult Function(SinceUnreleased value) unreleased,
  }) {
    return unreleased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SinceDartSdk value)? dartSdk,
    TResult? Function(SinceUnreleased value)? unreleased,
  }) {
    return unreleased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SinceDartSdk value)? dartSdk,
    TResult Function(SinceUnreleased value)? unreleased,
    required TResult orElse(),
  }) {
    if (unreleased != null) {
      return unreleased(this);
    }
    return orElse();
  }
}

abstract class SinceUnreleased extends Since {
  const factory SinceUnreleased() = _$SinceUnreleased;
  const SinceUnreleased._() : super._();
}
