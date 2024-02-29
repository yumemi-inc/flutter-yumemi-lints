import 'package:args/command_runner.dart';
import 'package:yumemi_lints/src/commands/update_command.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/utils/cli_info.dart';

class AppCommandRunner extends CommandRunner<ExitStatus> {
  AppCommandRunner() : super(CliInfo.name, CliInfo.description) {
    addCommand(UpdateCommand());
  }

  @override
  Future<ExitStatus> run(Iterable<String> args) async {
    try {
      final argResults = parse(args);
      return await runCommand(argResults) ?? ExitStatus.success;
    } on UsageException catch (e) {
      print(e.message);
      print(e.usage);
      return ExitStatus.usage;
    } on Exception catch (e) {
      print(e);
      return ExitStatus.error;
    }
  }
}
