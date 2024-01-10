import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lint_rules_dir.g.dart';

@Riverpod(dependencies: [])
external Directory lintRulesDir(LintRulesDirRef ref);
