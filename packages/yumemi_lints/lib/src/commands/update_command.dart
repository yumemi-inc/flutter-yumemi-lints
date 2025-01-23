import 'package:yumemi_lints/src/command_services/update_command_service.dart';
import 'package:yumemi_lints/src/models/command.dart';
import 'package:yumemi_lints/yumemi_lints.dart';

class UpdateCommand extends Command<ExitStatus> {
  UpdateCommand();

  @override
  String get name => 'update';

  @override
  String get description => "Automatically update the version of yumemi_lints'"
      ' recommended.yaml to match the Dart or Flutter version of the project.';

  @override
  Future<ExitStatus> run() {
    const updateCommandService = UpdateCommandService();
    return updateCommandService.call();
  }
}
