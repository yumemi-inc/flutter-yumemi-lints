import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/models/project_type.dart';

final class UpdateCommandService {
  const UpdateCommandService();

  ExitStatus call() {
    return ExitStatus.success;
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

