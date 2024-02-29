import 'package:args/command_runner.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';

final class UpdateCommand extends Command<ExitStatus> {
  UpdateCommand();

  @override
  String get name => 'update';

  @override
  String get description => "Automatically update the version of yumemi_lints'"
      ' recommended.yaml to match the Dart or Flutter version of the project.';

  @override
  ExitStatus run() {
    const updateCommandService = UpdateCommandService();
    return updateCommandService.call();
  }
}
