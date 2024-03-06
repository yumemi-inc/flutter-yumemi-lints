import 'package:file/memory.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';

void main() {
  const updateCommandService = UpdateCommandService();
  group('UpdateCommandService.getDartVersion', () {
    group('Successfully extract dart version', () {
      // arrange
      const sdks = [
        '^2.17.0',
        '2.17.0',
        '>=2.17.0 <4.0.0',
        '<4.0.0 >=2.17.0',
      ];

      final files = [
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${sdks[0]}'
''',
          ),
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${sdks[1]}'
''',
          ),
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${sdks[2]}'
''',
          ),
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${sdks[3]}'
''',
          ),
      ];

      for (var i = 0; i < files.length; i++) {
        // act
        final version = updateCommandService.getDartVersion(files[i]);

        test('when input sdk version is ${sdks[i]}', () {
          // assert
          expect(
            version,
            Version(2, 17, 0),
          );
        });
      }
    });

    group('Failure to get dart version', () {
      // arrange
      const versionErrorMessageScenarios = [
        {
          'version': 'any',
          'errorMessage': 'Dart version could not be found from pubspec.yaml.'
        },
        {
          'version': '<4.0.0',
          'errorMessage': 'Please specify the minimum version.'
        },
      ];

      final files = [
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${versionErrorMessageScenarios[0]['version']}'
''',
          ),
        MemoryFileSystem().file('file')
          ..writeAsStringSync(
            '''
environment:
  sdk: '${versionErrorMessageScenarios[1]['version']}'
''',
          ),
      ];

      for (var i = 0; i < files.length; i++) {
        test(
            'when input sdk version is ${versionErrorMessageScenarios[i]['version']}',
            () {
          // act, assert
          expect(
            () => updateCommandService.getDartVersion(files[i]),
            throwsA(
              isA<FormatException>().having(
                (e) => e.message,
                'errorMessage',
                versionErrorMessageScenarios[i]['errorMessage'],
              ),
            ),
          );
        });
      }
    });
  });
}
