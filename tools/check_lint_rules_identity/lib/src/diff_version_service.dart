import 'dart:io';

import 'package:check_lint_rules_identity/src/lint_type.dart';
import 'package:meta/meta.dart';

import 'package:pub_semver/pub_semver.dart';

typedef Versions = ({Set<Version> flutter, Set<Version> dart});

class DiffVersionService {
  const DiffVersionService();
  Versions getDiffVersion(File diffPathListFile) {
    final paths = diffPathListFile.readAsLinesSync();
    final dartVersions = <Version>{};
    final flutterVersions = <Version>{};
    for (final path in paths) {
      final data = selectionVersion(path);
      switch (data.type) {
        case LintType.dart:
          dartVersions.add(data.version);
        case LintType.flutter:
          flutterVersions.add(data.version);
      }
    }

    return (flutter: flutterVersions, dart: dartVersions);
  }

  @visibleForTesting
  ({LintType type, Version version}) selectionVersion(String path) {
    const nameVersion = 'version';
    const nameType = 'type';
    final regexp =
        RegExp('(?<$nameType>\\w+)\\/(?<$nameVersion>\\d+\\.\\d+\\.\\d+)');
    final match = regexp.firstMatch(path);
    final versionText = match?.namedGroup(nameVersion);
    final typeText = match?.namedGroup(nameType);
    if (versionText == null || typeText == null) {
      throw FormatException();
    }

    final type = LintType.values.byNameOrNull(typeText);
    if (type == null) {
      throw FormatException();
    }

    return (type: type, version: Version.parse(versionText));
  }
}
