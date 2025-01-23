import 'package:yumemi_lints/src/models/arg_results.dart';
import 'package:yumemi_lints/src/models/command.dart';
import 'package:yumemi_lints/src/utils/arg_parser.dart';

/// A class for invoking [Command]s based on raw command-line arguments.
/// The type argument `T` represents the type returned by [Command.run] and
/// [CommandRunner.run]. If the return value is not used, null is returned.
class CommandRunner<T> {
  CommandRunner(this.executableName, this.description)
      : _argParser = ArgParser();

  final String executableName;

  final String description;

  final ArgParser<T> _argParser;
  ArgParser<T> get argParser => _argParser;

  void addCommand(Command<T> command) {
    argParser.addCommand(command);
  }

  ArgResults<T> parse(Iterable<String> args) => argParser.parse(args);

  Future<T?> runCommand(ArgResults<T> topLevelResults) async {
    final command = topLevelResults.command;
    if (command == null) {
      return null;
    }
    return await command.run();
  }

  /// In [CommandRunner], the [run] method is abstract
  /// and users are required to override it.
  Future<T?> run(Iterable<String> args) =>
      throw UnimplementedError('Leaf command $this must implement run().');
}
