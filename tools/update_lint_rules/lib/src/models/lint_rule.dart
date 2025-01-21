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
    required List<String> categories,
    required RuleState state,
    @JsonKey(name: 'incompatible') required List<String> incompatibles,
    required List<RuleSet> sets,
    required FixStatus fixStatus,
    required String details,
    @JsonKey(name: 'sinceDartSdk') required Since since,
  }) = _Rule;

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  const Rule._();
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

  static final _versionRegExp = RegExp(r'^(\d+)\.(\d+)$');

  factory Since.fromJson(String value) {
    final match = _versionRegExp.firstMatch(value);
    if (match == null) {
      // NOTE:
      //  This is a workaround for the fact that the `sinceDartSdk` field in the [rules.json] is not always a valid version.
      //  Expected format: "1.0", "2.1", etc.
      //  Unexpected format examples: "3.3-wip", "3.5-dev", etc.
      //  [rules.json]: https://github.com/dart-lang/sdk/blob/main/pkg/linter/tool/machine/rules.json
      return SinceUnreleased();
    }

    final major = int.parse(match[1]!);
    final minor = int.parse(match[2]!);
    const patch = 0;
    final version = Version(
      major,
      minor,
      patch,
    );

    return SinceDartSdk(version);
  }

  String toJson() => switch (this) {
        SinceDartSdk(version: final version) =>
          '${version.major}.${version.minor}',
        SinceUnreleased() => 'unreleased',
      };
}
