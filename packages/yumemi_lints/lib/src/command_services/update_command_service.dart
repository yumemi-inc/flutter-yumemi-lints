import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml/yaml.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/models/project_type.dart';

class UpdateCommandService {
  const UpdateCommandService();

  ExitStatus call() {
    try {
      // Determine if it is a Dart project or a Flutter project
      final projectType = _getProjectType();

      switch (projectType) {
        case ProjectType.dart:
          return _updateDartProjectLintRule();
        case ProjectType.flutter:
          return _updateFlutterProjectLintRule();
      }
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }

  ExitStatus _updateDartProjectLintRule() {
    final command = Process.runSync('dart', ['--version']);

    final exitStatus = ExitStatus.fromCode(command.exitCode);
    if (exitStatus != ExitStatus.success) {
      return exitStatus;
    }

    try {
      final dartVersion = getDartVersion(_getPubspecFile());

      final includeLine =
          'include: package:yumemi_lints/dart/${dartVersion.excludePatchVersion}/recommended.yaml';
      _updateLintRule(includeLine);

      return ExitStatus.success;
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }
  }

  ExitStatus _updateFlutterProjectLintRule() {
    final command = Process.runSync('flutter', ['--version']);

    final exitStatus = ExitStatus.fromCode(command.exitCode);
    if (exitStatus != ExitStatus.success) {
      return exitStatus;
    }

    try {
      final flutterVersion = getFlutterVersion(command.stdout.toString());
      final includeLine =
          'include: package:yumemi_lints/flutter/${flutterVersion.excludePatchVersion}/recommended.yaml';
      _updateLintRule(includeLine);

      return ExitStatus.success;
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }
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

  @visibleForTesting
  Version getFlutterVersion(String input) {
    final regExp = RegExp(r'Flutter\s+(\d+\.\d+\.\d+)');
    final match = regExp.firstMatch(input);

    if (match == null) {
      throw const FormatException(
        'Flutter version could not be found from [flutter --version].',
      );
    }

    final version = match.group(1);
    if (version == null) {
      throw const FormatException('Flutter version extraction failed.');
    }

    return Version.parse(version);
  }

  @visibleForTesting
  Version getDartVersion(File pubspecFile) {
    final yaml = loadYaml(pubspecFile.readAsStringSync()) as YamlMap;
    final dartVersion = (yaml['environment'] as YamlMap)['sdk'] as String;

    RegExp regExp;
    if (dartVersion.contains('<') && !dartVersion.contains('>=')) {
      throw FormatException('Please specify the minimum version.');
    }

    if (dartVersion.contains('>=')) {
      regExp = RegExp(r'>=\s*(\d+\.\d+\.\d+)');
    } else {
      regExp = RegExp(r's*(\d+\.\d+\.\d+)');
    }
    final match = regExp.firstMatch(dartVersion);

    if (match == null) {
      throw FormatException(
        'Dart version could not be found from pubspec.yaml.',
      );
    }

    final version = match.group(1);
    if (version == null) {
      throw const FormatException('Dart version extraction failed.');
    }

    return Version.parse(version);
  }

  void _updateLintRule(String includeLine) {
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
      newLines.insert(1, '');
    }

    analysisOptionsFile.writeAsStringSync(newLines.join('\n'));
  }
}

extension _VersionExt on Version {
  String get excludePatchVersion => '$major.$minor';
}
