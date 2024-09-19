import 'package:test/test.dart';
import 'package:yumemi_lints/src/models/version.dart';

void main() {
  group('Version.parse()', () {
    // arrange
    const successfulScenarios = [
      {
        'input': '^2.17.0',
        'expected': Version(2, 17),
      },
      {
        'input': '2.17.0',
        'expected': Version(2, 17),
      },
      {
        'input': '>=2.17.0 <4.0.0',
        'expected': Version(2, 17),
      },
      {
        'input': '<4.0.0 >=2.17.0',
        'expected': Version(2, 17),
      },
      {
        'input': '^2.17.1',
        'expected': Version(2, 17),
      },
    ];

    for (final scenario in successfulScenarios) {
      final input = scenario['input']! as String;
      final expected = scenario['expected']! as Version;

      test(
        'The version is successfully parsed '
        'when the input text is `$input`',
        () {
          // act
          final actual = Version.parse(input);

          // assert
          expect(actual, expected);
        },
      );
    }

    // arrange
    final failureScenarios = [
      {
        'input': '<4.0.0',
        'expected': throwsA(isA<MinimumVersionMissingException>()),
      },
      {
        'input': 'any',
        'expected': throwsA(isA<UnsupportedVersionFormatException>()),
      },
    ];

    for (final scenario in failureScenarios) {
      final input = scenario['input']! as String;
      final expected = scenario['expected']! as Matcher;

      test(
        'The version fails to be parsed '
        'when the input text is `$input`',
        () {
          // act
          void actual() {
            Version.parse(input);
          }

          // assert
          expect(actual, expected);
        },
      );
    }
  });
}
