import 'package:yumemi_lints/yumemi_lints.dart';

class UpdateCommand {
  UpdateCommand();

  String get name => 'update';

  Future<ExitStatus?> run() async {
    return ExitStatus.success;
  }

  bool check(Iterable<String> args) {
    return args.contains(name);
  }
}
