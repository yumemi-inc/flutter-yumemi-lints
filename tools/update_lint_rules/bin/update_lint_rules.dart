import 'dart:io';

import 'package:update_lint_rules/update_lint_rules.dart' as update_lint_rules;

void main(List<String> args) async {
  final status = await update_lint_rules.run(args);
  return Future.wait([
    stdout.close(),
    stderr.close(),
  ]).then((_) => exit(status.code));
}
