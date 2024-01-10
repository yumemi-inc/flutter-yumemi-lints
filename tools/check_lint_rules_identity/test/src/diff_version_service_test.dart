import 'package:collection/collection.dart';
import 'package:file/memory.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:check_lint_rules_identity/src/diff_version_service.dart';

void main() {
  group(
    DiffVersionService,
    () {
      test(
        '差分ファイルのパスがまとめられたファイルから、バージョンを解析できる',
        () {
          // Arrange
          final file = MemoryFileSystem().file('file')..writeAsStringSync('''
build/flutter/3.16.4/all.yaml
build/flutter/3.16.4/recommended.yaml
build/flutter/3.16.3/all.yaml
build/flutter/3.16.3/recommended.yaml
build/dart/3.2.3/all.yaml
build/dart/3.2.3/recommended.yaml
build/dart/3.2.2/all.yaml
build/dart/3.2.2/recommended.yaml
''');
          final service = DiffVersionService(file);

          // Act
          final act = service.getDiffVersion();

          // Expect
          expect(
              SetEquality().equals(act.dart, {
                Version(3, 2, 3),
                Version(3, 2, 2),
              }),
              true);
          expect(
              SetEquality().equals(act.flutter, {
                Version(3, 16, 4),
                Version(3, 16, 3),
              }),
              true);
        },
      );
    },
  );
}
