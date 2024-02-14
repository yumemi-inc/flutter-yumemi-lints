import 'package:check_lint_rules_identity/src/utils/version_utils.dart';
import 'package:check_lint_rules_identity/src/version_paths_file.dart';
import 'package:check_lint_rules_identity/src/models/lint_type.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';

import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diff_version_service.g.dart';

typedef Versions = ({Set<Version> flutter, Set<Version> dart});

@Riverpod(dependencies: [versionPathsFile])
DiffVersionService diffVersionService(DiffVersionServiceRef ref) {
  final diffPathListFile = ref.watch(versionPathsFileProvider);
  return DiffVersionService(diffPathListFile);
}

class DiffVersionService {
  const DiffVersionService(this.diffPathListFile);
  final File diffPathListFile;
  Versions getDiffVersion() {
    final paths = diffPathListFile.readAsLinesSync();
    final versions = paths.map(extractVersion);
    final flutterVersions = versions
        .where((version) => version.type == LintType.flutter)
        .map((version) => version.version)
        .toSet();
    final dartVersions = versions
        .where((version) => version.type == LintType.dart)
        .map((version) => version.version)
        .toSet();
    return (flutter: flutterVersions, dart: dartVersions);
  }

  @visibleForTesting
  ({LintType type, Version version}) extractVersion(String path) {
    const nameVersion = 'version';
    const nameType = 'type';
    final regexp =
        RegExp('(?<$nameType>\\w+)\\/(?<$nameVersion>\\d+\\.\\d+)');
    final match = regexp.firstMatch(path);
    final versionText = match?.namedGroup(nameVersion);
    final typeText = match?.namedGroup(nameType);

    final versionParsingException = FormatException(
        '[Version Parsing Exception] Version parsing from Path failed. The pull request may contain changes other than LintRule. \nPATH=$path');

    if (versionText == null || typeText == null) {
      throw versionParsingException;
    }

    final type = LintType.values.byNameOrNull(typeText);
    if (type == null) {
      throw versionParsingException;
    }

    return (type: type, version: parseStringToVersion(versionText));
  }
}
