enum ExitStatus {
  success(0),
  usage(64),
  error(1),
  ;

  const ExitStatus(this.code);

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

  final int code;
}
