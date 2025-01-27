import 'package:yumemi_lints/src/command_services/update_command_service.dart';
import 'package:yumemi_lints/yumemi_lints.dart';

class UpdateCommand {
  UpdateCommand();

  String get name => 'update';

  Future<ExitStatus?> run() async {
    const updateCommandService = UpdateCommandService();
    return updateCommandService.call();
  }

  bool shouldRunCommand(Iterable<String> args) {
    return args.contains(name);
  }
}
