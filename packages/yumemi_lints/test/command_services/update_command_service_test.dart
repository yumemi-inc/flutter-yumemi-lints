import 'package:file/memory.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';
import 'package:yumemi_lints/src/models/project_type.dart';
import 'package:yumemi_lints/src/models/version.dart';

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

  group('UpdateCommandService.getCompatibleVersion', () {
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
      group('Supported versions', () {
        // arrange
        const compatibleVersionScenarios = [
          _CompatibleVersionSuccessScenario(
            specified: '2.17.0',
            expected: '2.17.0',
          ),
          _CompatibleVersionSuccessScenario(
            specified: '3.0.0',
            expected: '3.0.0',
          ),
          _CompatibleVersionSuccessScenario(
            specified: '3.5.0',
            expected: '3.5.0',
          ),
        ];

        for (final compatibleVersionScenario in compatibleVersionScenarios) {
          final specifiedVersion =
              Version.parse(compatibleVersionScenario.specified);
          final expectedVersion =
              Version.parse(compatibleVersionScenario.expected);
          test(
            'The $expectedVersion is used, '
            'when the specified version is $specifiedVersion',
            () {
              // act
              final actual = updateCommandService.getCompatibleVersion(
                projectType: projectType,
                specifiedVersion: specifiedVersion,
                supportedVersions: supportedVersions,
                printMessage: printMessageMock.call,
              );

              // assert
              expect(actual, expectedVersion);
              verifyNever(printMessageMock.call(any));
            },
          );
        }
      });
      group('Higher than supported versions', () {
        // arrange
        const compatibleVersionScenarios = [
          _CompatibleVersionSuccessScenario(
            specified: '3.6.0',
            expected: '3.5.0',
          ),
        ];

        for (final compatibleVersionScenario in compatibleVersionScenarios) {
          final specifiedVersion =
              Version.parse(compatibleVersionScenario.specified);
          final expectedVersion =
              Version.parse(compatibleVersionScenario.expected);
          test(
            'The $expectedVersion is used, '
            'when the specified version is $specifiedVersion',
            () {
              // act
              final actual = updateCommandService.getCompatibleVersion(
                projectType: projectType,
                specifiedVersion: specifiedVersion,
                supportedVersions: supportedVersions,
                printMessage: printMessageMock.call,
              );

              // assert
              expect(actual, expectedVersion);
              verify(printMessageMock.call(any)).called(1);
            },
          );
        }
      });
    });

    group('Failure', () {
      // arrange
      const compatibleVersionScenarios = [
        _CompatibleVersionFailureScenario(
          specified: '2.16.0',
        ),
        _CompatibleVersionFailureScenario(
          specified: '2.20.0',
        ),
      ];

      for (final compatibleVersionScenario in compatibleVersionScenarios) {
        final specifiedVersion =
            Version.parse(compatibleVersionScenario.specified);

        test(
          'Throw the compatibleVersionException, '
          'when the specified version is $specifiedVersion',
          () {
            // act
            Version actual() => updateCommandService.getCompatibleVersion(
                  projectType: projectType,
                  specifiedVersion: specifiedVersion,
                  supportedVersions: supportedVersions,
                  printMessage: printMessageMock.call,
                );

            // assert
            expect(actual, throwsA(isA<CompatibleVersionException>()));
            verify(printMessageMock.call(any)).called(1);
          },
        );
      }
    });
  });
}

class _CompatibleVersionSuccessScenario {
  const _CompatibleVersionSuccessScenario({
    required this.specified,
    required this.expected,
  });

  final String specified;
  final String expected;
}

class _CompatibleVersionFailureScenario {
  const _CompatibleVersionFailureScenario({
    required this.specified,
  });

  final String specified;
}

class _PrintMessageMock extends Mock {
  void call(dynamic message);
}
