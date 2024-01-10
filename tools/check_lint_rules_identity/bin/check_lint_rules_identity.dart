import 'dart:io';

import 'package:check_lint_rules_identity/check_lint_rules_identity.dart'
    as check_lint_rules_identity;

void main(List<String> arguments) async {
  final status = await check_lint_rules_identity.run(arguments);
  return Future.wait([
    stdout.close(),
    stderr.close(),
  ]).then((_) => exit(status.code));
}
