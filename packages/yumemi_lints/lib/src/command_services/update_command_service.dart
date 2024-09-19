import 'dart:io';
import 'dart:isolate';

import 'package:yaml/yaml.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/models/project_type.dart';
import 'package:yumemi_lints/src/models/version.dart';

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
    final Version specifiedVersion;
    try {
      switch (projectType) {
        case ProjectType.dart:
          specifiedVersion = getDartVersion(_getPubspecFile());
          break;
        case ProjectType.flutter:
          specifiedVersion = getFlutterVersion(_getPubspecFile());
          break;
      }
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }

    final supportedVersions = await _getSupportedVersions(projectType);

    final Version compatibleVersion;
    try {
      compatibleVersion = getCompatibleVersion(
        projectType: projectType,
        specifiedVersion: specifiedVersion,
        supportedVersions: supportedVersions,
      );
    } on CompatibleVersionException catch (_) {
      // Already printed error messages, so nothing to do.
      return ExitStatus.error;
    }

    final includeLine =
        'include: package:yumemi_lints/${projectType.name}/$compatibleVersion/recommended.yaml';
    _updateAnalysisOptionsFile(includeLine);
    return ExitStatus.success;
  }

  File _getPubspecFile() {
    final pubspecFile = File(
      [
        Directory.current.path,
        'pubspec.yaml',
      ].join(_separator),
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
        .whereType<Directory>()
        .map(
          (e) => Version.parse(e.name),
        )
        .toList();

    // Sort by smallest to largest
    supportedVersions.sort((a, b) => a.compareTo(b));
    return supportedVersions;
  }

  Version getCompatibleVersion({
    required ProjectType projectType,
    required Version specifiedVersion,
    required List<Version> supportedVersions,
    void Function(String) printMessage = print,
  }) {
    final oldestSupportedVersion = supportedVersions.first;
    final latestSupportedVersion = supportedVersions.last;

    if (supportedVersions.contains(specifiedVersion)) {
      return specifiedVersion;
    }

    // If higher than the oldest supported version and lower than the latest
    // supported version, but does not match any of the supported versions,
    // print an error message and exit with an error.
    if (latestSupportedVersion < specifiedVersion) {
      final projectTypeFormalName = projectType.formalName;
      printMessage(
        '$projectTypeFormalName $specifiedVersion is not supported by '
        'yumemi_lints. Use the latest supported $projectTypeFormalName '
        '$latestSupportedVersion instead.',
      );
      return latestSupportedVersion;
    }

    // If lower than the oldest supported version, print an error message and
    // exit with an error.
    if (oldestSupportedVersion > specifiedVersion) {
      final projectTypeFormalName = projectType.formalName;
      printMessage(
        '$projectTypeFormalName $specifiedVersion is not supported by '
        'yumemi_lints and should be used with $projectTypeFormalName '
        '$oldestSupportedVersion or higher projects.',
      );
      throw const CompatibleVersionException();
    }

    // If higher than the oldest supported version and lower than the latest
    // supported version, but does not match any of the supported versions,
    // print an error message and exit with an error.
    printMessage(
      'The version of ${projectType.formalName} $specifiedVersion specified '
      'in pubspec.yaml does not exist. Please specify the version '
      'that exists.',
    );
    throw const CompatibleVersionException();
  }

  Version getFlutterVersion(File pubspecFile) {
    final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;
    final flutterVersion = (yaml['environment'] as YamlMap)['flutter'];

    if (flutterVersion == null) {
      throw const FormatException(
        'Please put [flutter: Flutter Version] '
        'under the environment section in pubspec.yaml',
      );
    }

    return Version.parse(flutterVersion as String);
  }

  Version getDartVersion(File pubspecFile) {
    final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;
    final dartVersion = (yaml['environment'] as YamlMap)['sdk'];

    if (dartVersion == null) {
      throw const FormatException(
        'Please put [sdk: Dart Version] '
        'under the environment section in pubspec.yaml',
      );
    }

    return Version.parse(dartVersion as String);
  }

  void _updateAnalysisOptionsFile(String includeLine) {
    final analysisOptionsFile = File(
      [
        Directory.current.path,
        'analysis_options.yaml',
      ].join(_separator),
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
    return path.split('/').last;
  }
}

bool get _isWindowsStyle {
  if (Uri.base.scheme != 'file') {
    return false;
  }
  if (!Uri.base.path.endsWith('/')) {
    return false;
  }
  return Uri(path: 'a/b').toFilePath() == r'a\b';
}

String get _separator {
  if (_isWindowsStyle) {
    return r'\';
  }
  return '/';
}
