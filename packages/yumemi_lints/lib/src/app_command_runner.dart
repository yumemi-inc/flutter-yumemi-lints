import 'dart:async';

import 'package:yumemi_lints/src/commands/update_command.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/utils/cli_info.dart';
import 'package:yumemi_lints/src/utils/command_runner.dart';

/// A command runner for the yumemi_lints
class AppCommandRunner extends CommandRunner<ExitStatus> {
  /// Creates a new instance of [AppCommandRunner]
  AppCommandRunner() : super(CliInfo.name, CliInfo.description) {
    addCommand(UpdateCommand());
  }

  @override
  Future<ExitStatus> run(Iterable<String> args) async {
    try {
      final argResults = parse(args);
      return await runCommand(argResults) ?? ExitStatus.success;
    } on ArgParserException catch (e) {
      print(e.message);
      print(e.commandName);
      return ExitStatus.usage;
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }
}
