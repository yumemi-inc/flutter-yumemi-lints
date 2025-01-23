class CompatibleVersionException implements Exception {
  const CompatibleVersionException();
}

class ArgParserException implements Exception {
  ArgParserException(this.message, this.commandName);

  final String message;
  final String commandName;

  @override
  String toString() => message;
}
