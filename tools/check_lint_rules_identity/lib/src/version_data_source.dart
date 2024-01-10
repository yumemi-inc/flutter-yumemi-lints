import 'dart:io';

import 'package:async/async.dart';
import 'package:check_lint_rules_identity/src/lint_rules_dir.dart';
import 'package:check_lint_rules_identity/src/models/lint_type.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'version_data_source.g.dart';

@riverpod
DartVersionDataSource dartVersionDataSource(DartVersionDataSourceRef ref) {
  final dir = ref.watch(lintRulesDirProvider);
  return DartVersionDataSource(lintRulesDir: dir);
}

@riverpod
FlutterVersionDataSource flutterVersionDataSource(
    FlutterVersionDataSourceRef ref) {
  final dir = ref.watch(lintRulesDirProvider);
  return FlutterVersionDataSource(lintRulesDir: dir);
}

class DartVersionDataSource extends VersionDataSource {
  DartVersionDataSource({required super.lintRulesDir});

  @override
  LintType get type => LintType.dart;
}

class FlutterVersionDataSource extends VersionDataSource {
  FlutterVersionDataSource({required super.lintRulesDir});

  @override
  LintType get type => LintType.flutter;
}

abstract class VersionDataSource {
  VersionDataSource({required Directory lintRulesDir})
      : _lintRulesDir = lintRulesDir;

  final Directory _lintRulesDir;
  LintType get type;
  final _versionDirsMemo = AsyncMemoizer<Iterable<Directory>>();

  final _versionsMemo = AsyncMemoizer<List<Version>>();

  Future<List<Version>> readVersions() => _versionsMemo.runOnce(() async {
        final versions = (await _readVersionDirs())
            .map((e) => Version.parse(e.name))
            .toList()
          ..sort((a, b) => a.compareTo(b));

        return versions;
      });

  Future<Iterable<Directory>> _readVersionDirs() =>
      _versionDirsMemo.runOnce(() async {
        final dartAndFlutterLintRuleDirs =
            (await _lintRulesDir.list().toList()).whereType<Directory>();
        final targetTypeDir = dartAndFlutterLintRuleDirs
            .where((dir) => dir.name == type.name)
            .first;

        return (await targetTypeDir.list().toList()).whereType<Directory>();
      });

  Future<String> readAllYamlAsString(Version version) async {
    final targetVersionDir = (await _readVersionDirs())
        .firstWhere((dir) => Version.parse(dir.name) == version);

    final ls = await targetVersionDir.list().toList();
    final allYaml = ls
        .whereType<File>()
        .where((element) => element.name == 'all.yaml')
        .first;
    return allYaml.readAsString();
  }

  Future<Version> getPreviousVersion(Version target) async {
    final allVersion = await readVersions();
    final targetIndex = allVersion.indexWhere((version) => version == target);

    return allVersion[targetIndex - 1];
  }
}

extension _FileSystemEntityName on FileSystemEntity {
  String get name => path.split('/').last;
}
