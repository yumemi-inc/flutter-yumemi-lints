// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'lint_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LintRule _$$_LintRuleFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_LintRule',
      json,
      ($checkedConvert) {
        final val = _$_LintRule(
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          group: $checkedConvert(
              'group', (v) => $enumDecode(_$RuleGroupEnumMap, v)),
          state: $checkedConvert(
              'state', (v) => $enumDecode(_$RuleStateEnumMap, v)),
          incompatibles: $checkedConvert('incompatible',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          sets: $checkedConvert(
              'sets',
              (v) => (v as List<dynamic>)
                  .map((e) => $enumDecode(_$RuleSetEnumMap, e))
                  .toList()),
          fixStatus: $checkedConvert(
              'fixStatus', (v) => $enumDecode(_$FixStatusEnumMap, v)),
          details: $checkedConvert('details', (v) => v as String),
          since: $checkedConvert(
              'sinceDartSdk', (v) => Since.fromJson(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'incompatibles': 'incompatible',
        'since': 'sinceDartSdk'
      },
    );

Map<String, dynamic> _$$_LintRuleToJson(_$_LintRule instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'group': _$RuleGroupEnumMap[instance.group]!,
      'state': _$RuleStateEnumMap[instance.state]!,
      'incompatible': instance.incompatibles,
      'sets': instance.sets.map((e) => _$RuleSetEnumMap[e]!).toList(),
      'fixStatus': _$FixStatusEnumMap[instance.fixStatus]!,
      'details': instance.details,
      'sinceDartSdk': instance.since.toJson(),
    };

const _$RuleGroupEnumMap = {
  RuleGroup.pub: 'pub',
  RuleGroup.style: 'style',
  RuleGroup.errors: 'errors',
};

const _$RuleStateEnumMap = {
  RuleState.stable: 'stable',
  RuleState.experimental: 'experimental',
  RuleState.deprecated: 'deprecated',
  RuleState.removed: 'removed',
};

const _$RuleSetEnumMap = {
  RuleSet.core: 'core',
  RuleSet.recommended: 'recommended',
  RuleSet.flutter: 'flutter',
};

const _$FixStatusEnumMap = {
  FixStatus.unregistered: 'unregistered',
  FixStatus.needsFix: 'needsFix',
  FixStatus.needsEvaluation: 'needsEvaluation',
  FixStatus.hasFix: 'hasFix',
  FixStatus.noFix: 'noFix',
};
