import 'package:yumemi_lints/src/models/command.dart';

/// Result class that wraps [Command]
class ArgResults<T> {
  const ArgResults(this.command);

  final Command<T>? command;
}
