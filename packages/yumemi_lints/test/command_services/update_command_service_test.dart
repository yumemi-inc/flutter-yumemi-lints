import 'package:file/memory.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';
import 'package:yumemi_lints/src/models/project_type.dart';

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
            'Please put [flutter: Flutter Version] '
                'under the environment section in pubspec.yaml',
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
            'Please put [sdk: Dart Version] '
                'under the environment section in pubspec.yaml',
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
      '^2.17.1',
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
        'errorMessage': 'The version of Dart or Flutter could not be found '
            'in pubspec.yaml. Please ensure that '
            'the version is correctly specified for Dart or Flutter.',
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

  group('UpdateCommandService.getUsedVersion', () {
    // arrange
    const projectType = ProjectType.dart;
    final supportedVersions = <String>[
      '2.17.0',
      '2.18.0',
      '2.19.0',
      '3.0.0',
      '3.1.0',
      '3.2.0',
      '3.3.0',
      '3.4.0',
      '3.5.0',
    ].map(Version.parse).toList();

    final printMessageMock = _PrintMessageMock();
    setUp(() {
      when(printMessageMock.call(any)).thenAnswer((_) {});
    });
    tearDown(() {
      reset(printMessageMock);
    });

    group('Success', () {
      // arrange
      const usedVersionScenarios = [
        _UsedVersionSuccessScenario(
          specified: '2.17.0',
          expected: '2.17.0',
        ),
        _UsedVersionSuccessScenario(
          specified: '3.0.0',
          expected: '3.0.0',
        ),
        _UsedVersionSuccessScenario(
          specified: '3.5.0',
          expected: '3.5.0',
        ),
        _UsedVersionSuccessScenario(
          specified: '3.6.0',
          expected: '3.5.0',
        ),
      ];

      for (final usedVersionScenario in usedVersionScenarios) {
        final specifiedVersion = Version.parse(usedVersionScenario.specified);
        final expectedVersion = Version.parse(usedVersionScenario.expected);
        test(
          'The $expectedVersion is used, '
          'when the specified version is $specifiedVersion',
          () {
            // act
            final actual = updateCommandService.getUsedVersion(
              projectType: projectType,
              specifiedVersion: specifiedVersion,
              supportedVersions: supportedVersions,
              printMessage: printMessageMock.call,
            );

            // assert
            expect(actual, expectedVersion);
            if (specifiedVersion > expectedVersion) {
              verify(printMessageMock.call(any)).called(1);
            } else {
              verifyNever(printMessageMock.call(any));
            }
          },
        );
      }
    });

    group('Failure', () {
      // arrange
      const usedVersionScenarios = [
        _UsedVersionFailureScenario(
          specified: '2.16.0',
        ),
        _UsedVersionFailureScenario(
          specified: '2.20.0',
        ),
      ];

      for (final usedVersionScenario in usedVersionScenarios) {
        final specifiedVersion = Version.parse(usedVersionScenario.specified);

        test(
          'Throw the UsedVersionException, '
          'when the specified version is $specifiedVersion',
          () {
            // act
            Version actual() => updateCommandService.getUsedVersion(
                  projectType: projectType,
                  specifiedVersion: specifiedVersion,
                  supportedVersions: supportedVersions,
                  printMessage: printMessageMock.call,
                );

            // assert
            expect(actual, throwsA(isA<UsedVersionException>()));
            verify(printMessageMock.call(any)).called(1);
          },
        );
      }
    });
  });
}

class _UsedVersionSuccessScenario {
  const _UsedVersionSuccessScenario({
    required this.specified,
    required this.expected,
  });

  final String specified;
  final String expected;
}

class _UsedVersionFailureScenario {
  const _UsedVersionFailureScenario({
    required this.specified,
  });

  final String specified;
}

class _PrintMessageMock extends Mock {
  void call(dynamic message);
}
