import 'dart:io';

import 'package:check_lint_rules_identity/src/diff_path_list_file.dart';
import 'package:check_lint_rules_identity/src/models/lint_type.dart';
import 'package:meta/meta.dart';

import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diff_version_service.g.dart';

typedef Versions = ({Set<Version> flutter, Set<Version> dart});

@riverpod
DiffVersionService diffVersionService(DiffVersionServiceRef ref) {
  final diffPathListFile = ref.watch(diffPathListFileProvider);
  return DiffVersionService(diffPathListFile);
}

class DiffVersionService {
  const DiffVersionService(this.diffPathListFile);
  final File diffPathListFile;
  Versions getDiffVersion() {
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
