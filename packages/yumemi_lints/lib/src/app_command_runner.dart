import 'package:yumemi_lints/src/commands/update_command.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';

/// A command runner for the yumemi_lints
class AppCommandRunner {
  AppCommandRunner();

  Future<ExitStatus> run(Iterable<String> args) async {
    try {
      if (args.isEmpty) {
        return ExitStatus.success;
      }
      final updateExit = await _evaluateUpdateCommand(args);
      return updateExit;
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }

  /// Evaluates [UpdateCommand].
  ///
  /// If [args] contains the `update` command, takes appropriate action.
  /// Otherwise, treats as an error.
  Future<ExitStatus> _evaluateUpdateCommand(Iterable<String> args) async {
    final updateCommand = UpdateCommand();
    if (updateCommand.shouldRunCommand(args)) {
    }
    return ExitStatus.error;
  }
}
