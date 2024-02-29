import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/models/project_type.dart';

final class UpdateCommandService {
  const UpdateCommandService();

  ExitStatus call() {
    try {
      // Determine if it is a Dart project or a Flutter project
      final projectType = _getProjectType();

      return switch (projectType) {
        ProjectType.dart => _updateDartProjectLint(),
        ProjectType.flutter => _updateFlutterProjectLint(),
      };
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }

  ExitStatus _updateDartProjectLint() {
    ProcessResult command;

    // Determine if dvm is being used
    final dvm = Directory(path.join(Directory.current.path, '.dvm'));
    if (dvm.existsSync()) {
      command = Process.runSync('dvm', ['dart', '--version']);
    } else {
      command = Process.runSync('dart', ['--version']);
    }

    try {
      final dartVersion = getDartVersion(command.stdout.toString());

      final includeLine =
          'include: package:yumemi_lints/dart/${dartVersion.excludePatchVersion}/recommended.yaml';
      _updateAnalysisOptionsFile(includeLine);

      return ExitStatus.success;
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }
  }

  ExitStatus _updateFlutterProjectLint() {
    ProcessResult command;

    // Determine if fvm is being used
    // fvm v3.0 <
    final fvm = Directory(path.join(Directory.current.path, '.fvm'));
    // fvm v3.0 >=
    final fvmrc = File(path.join(Directory.current.path, '.fvmrc'));
    if (fvm.existsSync() || fvmrc.existsSync()) {
      command = Process.runSync('fvm', ['flutter', '--version']);
    } else {
      command = Process.runSync('flutter', ['--version']);
    }

    try {
      final flutterVersion = getFlutterVersion(command.stdout.toString());
      final includeLine =
          'include: package:yumemi_lints/flutter/${flutterVersion.excludePatchVersion}/recommended.yaml';
      _updateAnalysisOptionsFile(includeLine);

      return ExitStatus.success;
    } on FormatException catch (e) {
      print(e.message);
      return ExitStatus.error;
    }
  }

  ProjectType _getProjectType() {
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
  Version getDartVersion(String input) {
    final regExp = RegExp(r'Dart SDK version:\s+(\d+\.\d+\.\d+)');
    final match = regExp.firstMatch(input);

    if (match == null) {
      throw const FormatException(
        'Dart version could not be found from [dart --version].',
      );
    }

    final version = match.group(1);
    if (version == null) {
      throw const FormatException('Dart version extraction failed.');
    }
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
      newLines.insert(1, '');
    }

    analysisOptionsFile.writeAsStringSync(newLines.join('\n'));
  }
}

extension VersionExt on Version {
  String get excludePatchVersion => '$major.$minor';
}
