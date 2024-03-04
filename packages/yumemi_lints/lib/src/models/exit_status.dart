/// Exit status codes for the command line application.
enum ExitStatus {
  /// The command was successful.
  success._(0),

  /// The command was used incorrectly.
  usage._(64),

  /// The command failed.
  error._(1),
  ;

  const ExitStatus._(this.code);

  /// Create an [ExitStatus] from the given [code].
  factory ExitStatus.fromCode(int code) {
    switch (code) {
      case 0:
        return ExitStatus.success;
      case 64:
        return ExitStatus.usage;
      default:
        return ExitStatus.error;
    }
  }

  /// The exit status code.
  final int code;
}
