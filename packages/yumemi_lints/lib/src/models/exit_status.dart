enum ExitStatus {
  success(0),
  usage(64),
  error(1),
  ;

  const ExitStatus(this.code);

  factory ExitStatus.fromCode(int code) => switch (code) {
        0 => ExitStatus.success,
        64 => ExitStatus.usage,
        _ => ExitStatus.error,
      };

  final int code;
}
