import 'package:collection/collection.dart';
import 'package:file/memory.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:check_lint_rules_identity/src/services/diff_version_service.dart';

void main() {
  group(
    DiffVersionService,
    () {
      test(
        'Analyze the version from a file containing the paths of differential files',
        () {
          // Arrange
          final file = MemoryFileSystem().file('file')..writeAsStringSync('''
build/flutter/3.16/all.yaml
build/flutter/3.16/recommended.yaml
build/flutter/3.13/all.yaml
build/flutter/3.13/recommended.yaml
build/dart/3.2/all.yaml
build/dart/3.2/recommended.yaml
build/dart/3.1/all.yaml
build/dart/3.1/recommended.yaml
''');
          final service = DiffVersionService(file);

          // Act
          final act = service.getDiffVersion();

          // Expect
          expect(
              SetEquality().equals(act.dart, {
                Version(3, 2, 0),
                Version(3, 1, 0),
              }),
              true);
          expect(
              SetEquality().equals(act.flutter, {
                Version(3, 16, 0),
                Version(3, 13, 0),
              }),
              true);
        },
      );
    },
  );
}
