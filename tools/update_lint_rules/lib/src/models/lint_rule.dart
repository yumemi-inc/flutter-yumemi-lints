import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';

part 'lint_rule.freezed.dart';

part 'lint_rule.g.dart';

typedef LintRules = ({
  Iterable<DartLintRule> dart,
  Iterable<FlutterLintRule> flutter,
});

@freezed
sealed class LintRule with _$LintRule {
  const factory LintRule.dart(Rule rule) = DartLintRule;

  const factory LintRule.flutter(Rule rule) = FlutterLintRule;
}

@freezed
class Rule with _$Rule {
  const factory Rule({
    required String name,
    required String description,
    required RuleGroup group,
    required RuleState state,
    @JsonKey(name: 'incompatible') required List<String> incompatibles,
    required List<RuleSet> sets,
    required FixStatus fixStatus,
    required String details,
    @JsonKey(name: 'sinceDartSdk') required Since since,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  const Rule._();

  bool get isFlutterOnly => sets.length == 1 && sets.first == RuleSet.flutter;
}

enum RuleGroup {
  pub,
  style,
  errors,
}

enum RuleState {
  stable,
  experimental,
  deprecated,
  removed,
}

enum RuleSet {
  core,
  recommended,
  flutter,
}

enum FixStatus {
  unregistered,
  needsFix,
  needsEvaluation,
  hasFix,
  noFix,
}

@Freezed(
  fromJson: false,
  toJson: false,
)
sealed class Since with _$Since {
  const Since._();

  const factory Since.dartSdk(Version version) = SinceDartSdk;

  const factory Since.unreleased() = SinceUnreleased;

  factory Since.fromJson(String value) {
    final Version version;
    try {
      version = Version.parse(value);
    } on FormatException {
      return SinceUnreleased();
    }
    return SinceDartSdk(version);
  }

  String toJson() => switch (this) {
        SinceDartSdk(version: final version) => version.toString(),
        SinceUnreleased() => 'unreleased',
      };
}
