/// https://dart.dev/tutorials/server/cmdline#setting-exit-codes
enum ExitStatus {
  success(0),
  warnings(1),
  errors(2),
  ;

  const ExitStatus(this.code);

  final int code;
}
