import 'dart:io';
import 'dart:isolate';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/models/project_type.dart';

class UpdateCommandService {
  const UpdateCommandService();

  Future<ExitStatus> call() async {
    try {
      // Determine if it is a Dart project or a Flutter project
      final projectType = _getProjectType();
      return _updateLintRule(projectType);
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }

  Future<ExitStatus> _updateLintRule(ProjectType projectType) async {
    Version version;
    try {
      switch (projectType) {
        case ProjectType.dart:
          version = getDartVersion(_getPubspecFile());
          break;
        case ProjectType.flutter:
          version = getFlutterVersion(_getPubspecFile());
          break;
      }
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }

    final supportedVersions = await _getSupportedVersions(projectType);

    // If lower than the oldest supported version, print error message and
    // exit as error.
    final oldestSupportedVersion = supportedVersions.first;
    if (oldestSupportedVersion > version) {
      final projectTypeFormalName = projectType.formalName;
      print(
        '$projectTypeFormalName $version is not supported by yumemi_lints and '
        'should be used with $projectTypeFormalName $oldestSupportedVersion or '
        'higher projects.',
      );
      return ExitStatus.error;
    }

    // If larger than the latest supported version, print warning message and
    // use the latest supported version.
    final latestSupportedVersion = supportedVersions.last;
    if (latestSupportedVersion < version) {
      final projectTypeFormalName = projectType.formalName;
      print(
        '$projectTypeFormalName $version is not supported by yumemi_lints. '
        'Use the latest supported $projectTypeFormalName '
        '$latestSupportedVersion instead.',
      );
      version = latestSupportedVersion;
    }

    final includeLine =
        'include: package:yumemi_lints/${projectType.name}/${version.excludePatchVersion}/recommended.yaml';
    _updateAnalysisOptionsFile(includeLine);
    return ExitStatus.success;
  }

  File _getPubspecFile() {
    final pubspecFile = File(
      path.join(
        Directory.current.path,
        'pubspec.yaml',
      ),
    );

    if (!pubspecFile.existsSync()) {
      throw Exception(
        'The pubspec.yaml file could not be found in the current directory. '
        'Please ensure that you are in the correct project directory '
        'or create a pubspec.yaml file if it does not exist.',
      );
    }

    return pubspecFile;
  }

  ProjectType _getProjectType() {
    final pubspecFile = _getPubspecFile();
    final lines = pubspecFile.readAsLinesSync();
    for (final line in lines) {
      if (line.trim() == 'sdk: flutter') {
        return ProjectType.flutter;
      }
    }
    return ProjectType.dart;
  }

  Future<List<Version>> _getSupportedVersions(ProjectType projectType) async {
    final lintRulesDirPackageUri = Uri.parse(
      'package:yumemi_lints/${projectType.name}',
    );

    final lintRulesDirPackageAbsoluteUri = await Isolate.resolvePackageUri(
      lintRulesDirPackageUri,
    );
    if (lintRulesDirPackageAbsoluteUri == null) {
      throw StateError('The yumemi_lints package not found.');
    }

    final lintRulesDir = Directory.fromUri(lintRulesDirPackageAbsoluteUri);
    if (!lintRulesDir.existsSync()) {
      throw StateError(
        'The ${projectType.name} directory in the yumemi_lints package '
        'not found.',
      );
    }

    final supportedVersions = lintRulesDir
        .listSync()
        .map(
          (e) => Version.parse('${e.name}.0'),
        )
        .toList();

    // Sort by smallest to largest
    supportedVersions.sort((a, b) => a.compareTo(b));
    return supportedVersions;
  }

  @visibleForTesting
  Version getFlutterVersion(File pubspecFile) {
    final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;
    final flutterVersion = (yaml['environment'] as YamlMap)['flutter'];

    if (flutterVersion == null) {
      throw const FormatException(
        'Please put [flutter: Flutter Version] '
        'under the environment section in pubspec.yaml',
      );
    }

    return extractVersion(flutterVersion as String);
  }

  @visibleForTesting
  Version getDartVersion(File pubspecFile) {
    final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;
    final dartVersion = (yaml['environment'] as YamlMap)['sdk'];

    if (dartVersion == null) {
      throw const FormatException(
        'Please put [sdk: Dart Version] '
        'under the environment section in pubspec.yaml',
      );
    }

    return extractVersion(dartVersion as String);
  }

  @visibleForTesting
  Version extractVersion(String versionString) {
    if (versionString.contains('<') && !versionString.contains('>=')) {
      throw const FormatException('Please specify the minimum version.');
    }

    RegExp regExp;
    if (versionString.contains('>=')) {
      regExp = RegExp(r'>=\s*(\d+\.\d+\.\d+)');
    } else {
      regExp = RegExp(r's*(\d+\.\d+\.\d+)');
    }
    final match = regExp.firstMatch(versionString);

    if (match == null) {
      throw const FormatException(
        'The version of Dart or Flutter could not be found in pubspec.yaml. '
        'Please ensure that '
        'the version is correctly specified for Dart or Flutter.',
      );
    }

    final version = match.group(1)!;
    return Version.parse(version);
  }

  void _updateAnalysisOptionsFile(String includeLine) {
    final analysisOptionsFile = File(
      path.join(Directory.current.path, 'analysis_options.yaml'),
    );
    if (!analysisOptionsFile.existsSync()) {
      // Create analysis_options.yaml if it does not exist
      analysisOptionsFile.createSync();
    }

    // Override analysis_options.yaml
    var foundIncludeLine = false;
    final lines = analysisOptionsFile.readAsLinesSync();
    final newLines = <String>[];

    for (final line in lines) {
      if (line.startsWith('include:')) {
        foundIncludeLine = true;
        newLines.add(includeLine);
      } else {
        newLines.add(line);
      }
    }

    // If there are no includes in analysis_options.yaml,
    // insert includes at the top
    if (!foundIncludeLine) {
      newLines.insert(0, includeLine);
    }

    analysisOptionsFile.writeAsStringSync('${newLines.join('\n')}\n');
  }
}

extension _VersionExt on Version {
  String get excludePatchVersion => '$major.$minor';
}

extension _ProjectTypeFormalName on ProjectType {
  String get formalName {
    switch (this) {
      case ProjectType.dart:
        return 'Dart';
      case ProjectType.flutter:
        return 'Flutter';
    }
  }
}

extension _FileSystemEntityName on FileSystemEntity {
  String get name {
    return this.path.split('/').last;
  }
}
