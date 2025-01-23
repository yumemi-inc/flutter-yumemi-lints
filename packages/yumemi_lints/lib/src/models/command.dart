import 'dart:async';

abstract class Command<T> {
  /// The name of this command.
  String get name;

  /// A description of this command, included in [].
  String get description;

  /// In [Command], the [run] method is abstract
  /// and users are required to override it.
  FutureOr<T>? run() {
    throw UnimplementedError('Leaf command $this must implement run().');
  }
}
