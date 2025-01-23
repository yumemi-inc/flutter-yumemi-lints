import 'dart:collection';

import 'package:yumemi_lints/src/models/arg_results.dart';
import 'package:yumemi_lints/src/models/command.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';

/// A class for taking a list of raw command line arguments and parsing out
/// options from them.
class ArgParser<T> {
  ArgParser() : _commands = {};

  final Map<String, Command<T>> _commands;
  Map<String, Command<T>> get commands => _commands;

  void addCommand(Command<T> command) {
    _commands[command.name] = command;
  }

  /// Parses [args], a list of command-line arguments, matches them against the
  /// options defined by this parser, and returns the result.
  ArgResults<T> parse(Iterable<String> args) {
    final queue = Queue.of(args);
    if (queue.isEmpty) {
      return const ArgResults(null);
    }
    while (queue.isNotEmpty) {
      if (queue.first == '--') {
        throw ArgParserException('"--" is not allowed.', queue.first);
      }
      final command = _commands[queue.first];
      if (command != null && command.name == 'update') {
        return ArgResults(command);
      }
      throw ArgParserException(
        'No commands other than "update" are allowed.',
        queue.first,
      );
    }
    return const ArgResults(null);
  }
}
