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

/// @nodoc
mixin _$LintRule {
  Rule get rule => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rule rule) dart,
    required TResult Function(Rule rule) flutter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rule rule)? dart,
    TResult? Function(Rule rule)? flutter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rule rule)? dart,
    TResult Function(Rule rule)? flutter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartLintRule value) dart,
    required TResult Function(FlutterLintRule value) flutter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartLintRule value)? dart,
    TResult? Function(FlutterLintRule value)? flutter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartLintRule value)? dart,
    TResult Function(FlutterLintRule value)? flutter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LintRuleCopyWith<LintRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LintRuleCopyWith<$Res> {
  factory $LintRuleCopyWith(LintRule value, $Res Function(LintRule) then) =
      _$LintRuleCopyWithImpl<$Res, LintRule>;
  @useResult
  $Res call({Rule rule});

  $RuleCopyWith<$Res> get rule;
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
    Object? rule = null,
  }) {
    return _then(_value.copyWith(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DartLintRuleCopyWith<$Res>
    implements $LintRuleCopyWith<$Res> {
  factory _$$DartLintRuleCopyWith(
          _$DartLintRule value, $Res Function(_$DartLintRule) then) =
      __$$DartLintRuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rule rule});

  @override
  $RuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$$DartLintRuleCopyWithImpl<$Res>
    extends _$LintRuleCopyWithImpl<$Res, _$DartLintRule>
    implements _$$DartLintRuleCopyWith<$Res> {
  __$$DartLintRuleCopyWithImpl(
      _$DartLintRule _value, $Res Function(_$DartLintRule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
  }) {
    return _then(_$DartLintRule(
      null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
    ));
  }
}

/// @nodoc

class _$DartLintRule implements DartLintRule {
  const _$DartLintRule(this.rule);

  @override
  final Rule rule;

  @override
  String toString() {
    return 'LintRule.dart(rule: $rule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DartLintRule &&
            (identical(other.rule, rule) || other.rule == rule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DartLintRuleCopyWith<_$DartLintRule> get copyWith =>
      __$$DartLintRuleCopyWithImpl<_$DartLintRule>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rule rule) dart,
    required TResult Function(Rule rule) flutter,
  }) {
    return dart(rule);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rule rule)? dart,
    TResult? Function(Rule rule)? flutter,
  }) {
    return dart?.call(rule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rule rule)? dart,
    TResult Function(Rule rule)? flutter,
    required TResult orElse(),
  }) {
    if (dart != null) {
      return dart(rule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartLintRule value) dart,
    required TResult Function(FlutterLintRule value) flutter,
  }) {
    return dart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartLintRule value)? dart,
    TResult? Function(FlutterLintRule value)? flutter,
  }) {
    return dart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartLintRule value)? dart,
    TResult Function(FlutterLintRule value)? flutter,
    required TResult orElse(),
  }) {
    if (dart != null) {
      return dart(this);
    }
    return orElse();
  }
}

abstract class DartLintRule implements LintRule {
  const factory DartLintRule(final Rule rule) = _$DartLintRule;

  @override
  Rule get rule;
  @override
  @JsonKey(ignore: true)
  _$$DartLintRuleCopyWith<_$DartLintRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FlutterLintRuleCopyWith<$Res>
    implements $LintRuleCopyWith<$Res> {
  factory _$$FlutterLintRuleCopyWith(
          _$FlutterLintRule value, $Res Function(_$FlutterLintRule) then) =
      __$$FlutterLintRuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rule rule});

  @override
  $RuleCopyWith<$Res> get rule;
}

/// @nodoc
class __$$FlutterLintRuleCopyWithImpl<$Res>
    extends _$LintRuleCopyWithImpl<$Res, _$FlutterLintRule>
    implements _$$FlutterLintRuleCopyWith<$Res> {
  __$$FlutterLintRuleCopyWithImpl(
      _$FlutterLintRule _value, $Res Function(_$FlutterLintRule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
  }) {
    return _then(_$FlutterLintRule(
      null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
    ));
  }
}

/// @nodoc

class _$FlutterLintRule implements FlutterLintRule {
  const _$FlutterLintRule(this.rule);

  @override
  final Rule rule;

  @override
  String toString() {
    return 'LintRule.flutter(rule: $rule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterLintRule &&
            (identical(other.rule, rule) || other.rule == rule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlutterLintRuleCopyWith<_$FlutterLintRule> get copyWith =>
      __$$FlutterLintRuleCopyWithImpl<_$FlutterLintRule>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Rule rule) dart,
    required TResult Function(Rule rule) flutter,
  }) {
    return flutter(rule);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Rule rule)? dart,
    TResult? Function(Rule rule)? flutter,
  }) {
    return flutter?.call(rule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Rule rule)? dart,
    TResult Function(Rule rule)? flutter,
    required TResult orElse(),
  }) {
    if (flutter != null) {
      return flutter(rule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartLintRule value) dart,
    required TResult Function(FlutterLintRule value) flutter,
  }) {
    return flutter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartLintRule value)? dart,
    TResult? Function(FlutterLintRule value)? flutter,
  }) {
    return flutter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartLintRule value)? dart,
    TResult Function(FlutterLintRule value)? flutter,
    required TResult orElse(),
  }) {
    if (flutter != null) {
      return flutter(this);
    }
    return orElse();
  }
}

abstract class FlutterLintRule implements LintRule {
  const factory FlutterLintRule(final Rule rule) = _$FlutterLintRule;

  @override
  Rule get rule;
  @override
  @JsonKey(ignore: true)
  _$$FlutterLintRuleCopyWith<_$FlutterLintRule> get copyWith =>
      throw _privateConstructorUsedError;
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return _Rule.fromJson(json);
}

/// @nodoc
mixin _$Rule {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
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
  $RuleCopyWith<Rule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleCopyWith<$Res> {
  factory $RuleCopyWith(Rule value, $Res Function(Rule) then) =
      _$RuleCopyWithImpl<$Res, Rule>;
  @useResult
  $Res call(
      {String name,
      String description,
      List<String> categories,
      RuleState state,
      @JsonKey(name: 'incompatible') List<String> incompatibles,
      List<RuleSet> sets,
      FixStatus fixStatus,
      String details,
      @JsonKey(name: 'sinceDartSdk') Since since});

  $SinceCopyWith<$Res> get since;
}

/// @nodoc
class _$RuleCopyWithImpl<$Res, $Val extends Rule>
    implements $RuleCopyWith<$Res> {
  _$RuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? categories = null,
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
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_RuleCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$_RuleCopyWith(_$_Rule value, $Res Function(_$_Rule) then) =
      __$$_RuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      List<String> categories,
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
class __$$_RuleCopyWithImpl<$Res> extends _$RuleCopyWithImpl<$Res, _$_Rule>
    implements _$$_RuleCopyWith<$Res> {
  __$$_RuleCopyWithImpl(_$_Rule _value, $Res Function(_$_Rule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? categories = null,
    Object? state = null,
    Object? incompatibles = null,
    Object? sets = null,
    Object? fixStatus = null,
    Object? details = null,
    Object? since = null,
  }) {
    return _then(_$_Rule(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$_Rule extends _Rule {
  const _$_Rule(
      {required this.name,
      required this.description,
      required final List<String> categories,
      required this.state,
      @JsonKey(name: 'incompatible') required final List<String> incompatibles,
      required final List<RuleSet> sets,
      required this.fixStatus,
      required this.details,
      @JsonKey(name: 'sinceDartSdk') required this.since})
      : _categories = categories,
        _incompatibles = incompatibles,
        _sets = sets,
        super._();

  factory _$_Rule.fromJson(Map<String, dynamic> json) => _$$_RuleFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

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
    return 'Rule(name: $name, description: $description, categories: $categories, state: $state, incompatibles: $incompatibles, sets: $sets, fixStatus: $fixStatus, details: $details, since: $since)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rule &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
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
      const DeepCollectionEquality().hash(_categories),
      state,
      const DeepCollectionEquality().hash(_incompatibles),
      const DeepCollectionEquality().hash(_sets),
      fixStatus,
      details,
      since);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RuleCopyWith<_$_Rule> get copyWith =>
      __$$_RuleCopyWithImpl<_$_Rule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RuleToJson(
      this,
    );
  }
}

abstract class _Rule extends Rule {
  const factory _Rule(
      {required final String name,
      required final String description,
      required final List<String> categories,
      required final RuleState state,
      @JsonKey(name: 'incompatible') required final List<String> incompatibles,
      required final List<RuleSet> sets,
      required final FixStatus fixStatus,
      required final String details,
      @JsonKey(name: 'sinceDartSdk') required final Since since}) = _$_Rule;
  const _Rule._() : super._();

  factory _Rule.fromJson(Map<String, dynamic> json) = _$_Rule.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get categories;
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
  _$$_RuleCopyWith<_$_Rule> get copyWith => throw _privateConstructorUsedError;
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
