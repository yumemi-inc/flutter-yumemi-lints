import 'dart:io';

import 'package:yumemi_lints/yumemi_lints.dart';

Future<void> main(List<String> args) async {
  final commandRunner = AppCommandRunner();
  final exitStatus = await commandRunner.run(args);
  await exitStatus.flushThenExit();
}

extension _FlushThenExit on ExitStatus {
  Future<void> flushThenExit() async => Future.wait(
        [
          stdout.close(),
          stderr.close(),
        ],
      ).then(
        (_) => exit(code),
      );
}
