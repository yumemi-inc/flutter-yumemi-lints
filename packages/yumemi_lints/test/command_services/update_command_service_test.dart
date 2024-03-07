import 'package:file/memory.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';

void main() {
  const updateCommandService = UpdateCommandService();
  group('UpdateCommandService.getFlutterVersion', () {
    test(
        'Throws FormatException '
        'when the flutter version is not listed in pubspec.yaml', () {
      // arrange
      final file = MemoryFileSystem().file('file')
        ..writeAsStringSync(
          '''
environment:
  sdk: '2.17.0'
''',
        );

      // act, assert
      expect(
        () => updateCommandService.getFlutterVersion(file),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'errorMessage',
            'Please list the Flutter version to be used in pubspec.yaml.',
          ),
        ),
      );
    });
  });

  group('UpdateCommandService.getDartVersion', () {
    test(
        'Throws FormatException '
        'when the dart version is not listed in pubspec.yaml', () {
      // arrange
      final file = MemoryFileSystem().file('file')
        ..writeAsStringSync(
          '''
environment:
  flutter: '3.16.7'
''',
        );

      // act, assert
      expect(
        () => updateCommandService.getDartVersion(file),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'errorMessage',
            'Please list the Dart version to be used in pubspec.yaml.',
          ),
        ),
      );
    });
  });

  group('UpdateCommandService.extractVersion', () {
    // arrange
    const versions = [
      '^2.17.0',
      '2.17.0',
      '>=2.17.0 <4.0.0',
      '<4.0.0 >=2.17.0',
    ];

    for (var i = 0; i < versions.length; i++) {
      // act
      final version = updateCommandService.extractVersion(versions[i]);

      test(
          'Successfully extract version '
          'when input version is ${versions[i]}', () {
        // assert
        expect(
          version,
          Version(2, 17, 0),
        );
      });
    }

    // arrange
    const versionErrorScenarios = [
      {
        'version': 'any',
        'errorMessage': 'Version could not be found from pubspec.yaml.',
      },
      {
        'version': '<4.0.0',
        'errorMessage': 'Please specify the minimum version.',
      },
    ];

    for (var i = 0; i < versionErrorScenarios.length; i++) {
      test(
          'Failure to extract version '
          'when input version is ${versionErrorScenarios[i]['version']}', () {
        // act, assert
        expect(
          () => updateCommandService
              .extractVersion(versionErrorScenarios[i]['version']!),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'errorMessage',
              versionErrorScenarios[i]['errorMessage'],
            ),
          ),
        );
      });
    }
  });
}
