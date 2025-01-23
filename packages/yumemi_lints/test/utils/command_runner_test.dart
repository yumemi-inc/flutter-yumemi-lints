import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/commands/update_command.dart';
import 'package:yumemi_lints/src/models/exceptions.dart';
import 'package:yumemi_lints/src/models/exit_status.dart';
import 'package:yumemi_lints/src/utils/cli_info.dart';
import 'package:yumemi_lints/src/utils/command_runner.dart';

void main() {
  final commandRunner =
      CommandRunner<ExitStatus>(CliInfo.name, CliInfo.description);

  void _addFakeUpdateCommand() {
    final fakeUpdateCommand = FakeUpdateCommand.success();
    commandRunner.addCommand(fakeUpdateCommand);
  }

  void _addFakeUpdateCommandWithError() {
    final fakeUpdateCommand = FakeUpdateCommand.error();
    commandRunner.addCommand(fakeUpdateCommand);
  }

  group('CommandRunner.addCommand', () {
    test('Success added command', () {
      _addFakeUpdateCommand();
      expect(commandRunner.argParser.commands['update'], isA<UpdateCommand>());
    });
  });

  group('CommandRunner.parse', () {
    test('Success update args parse', () {
      _addFakeUpdateCommand();
      final args = ['update'];
      final result = commandRunner.parse(args);
      expect(result.command?.name, 'update');
    });

    test(
      'Throws ArgParserException. '
      '"--" args are not accepted so an exception is thrown',
      () {
        final args = ['--'];
        expect(
          () => commandRunner.parse(args),
          throwsA(
            isA<ArgParserException>().having(
              (e) => e.message,
              'message',
              '"--" is not allowed.',
            ),
          ),
        );
      },
    );

    test(
      'Throws ArgParserException. '
      'An exception is thrown because arguments other than the "update" '
      'argument are not accepted.',
      () {
        final args = ['option'];
        expect(
          () => commandRunner.parse(args),
          throwsA(
            isA<ArgParserException>().having(
              (e) => e.message,
              'message',
              'No commands other than "update" are allowed.',
            ),
          ),
        );
      },
    );

    test(
      'Throws ArgParserException. '
      'Most command line tools have a help option, '
      'but yumemi_lints does not accept it and will throw an exception.',
      () {
        final args = ['help'];
        expect(
          () => commandRunner.parse(args),
          throwsA(
            isA<ArgParserException>().having(
              (e) => e.message,
              'message',
              'No commands other than "update" are allowed.',
            ),
          ),
        );
      },
    );

    test('Success no args parse', () {
      final args = <String>[];
      final result = commandRunner.parse(args);
      expect(result.command, isNull);
    });
  });

  group('CommandRunner.runCommand', () {
    test('Success run update command', () async {
      _addFakeUpdateCommand();
      final args = ['update'];
      final argResults = commandRunner.parse(args);
      final result = await commandRunner.runCommand(argResults);
      expect(result, ExitStatus.success);
    });

    test('Success run no command', () async {
      final args = <String>[];
      final argResults = commandRunner.parse(args);
      final result = await commandRunner.runCommand(argResults);
      expect(result, isNull);
    });

    test('failed run command', () async {
      _addFakeUpdateCommandWithError();
      final args = ['update'];
      final argResults = commandRunner.parse(args);
      final result = await commandRunner.runCommand(argResults);
      expect(result, ExitStatus.error);
    });
  });
}

/// Fake class for testing UpdateCommand
class FakeUpdateCommand extends Fake implements UpdateCommand {
  factory FakeUpdateCommand.success() => FakeUpdateCommand._();
  factory FakeUpdateCommand.error() => FakeUpdateCommand._(
        exitStatus: ExitStatus.error,
      );

  FakeUpdateCommand._({
    ExitStatus exitStatus = ExitStatus.success,
  }) : _exitStatus = exitStatus;

  final ExitStatus _exitStatus;

  @override
  String get name => 'update';

  @override
  Future<ExitStatus> run() async {
    return _exitStatus;
  }
}
