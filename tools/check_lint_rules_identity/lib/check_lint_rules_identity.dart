import 'package:check_lint_rules_identity/src/services/diff_version_service.dart';
import 'package:check_lint_rules_identity/src/version_paths_file.dart';
import 'package:check_lint_rules_identity/src/models/exit_status.dart';
import 'package:check_lint_rules_identity/src/services/identity_verification_service.dart';
import 'package:check_lint_rules_identity/src/lint_rules_dir.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:meta/meta.dart';
import 'package:riverpod/riverpod.dart';

Future<ExitStatus> run(List<String> argument) async {
  final fileSystem = LocalFileSystem();

  final diffPathListFilePath = argument.firstOrNull;
  if (diffPathListFilePath == null ||
      !fileSystem.isFileSync(diffPathListFilePath)) {
    throw ArgumentError(
        'The first argument must be a valid path to an existing file.');
  }

  final lintRulesDirPath = argument.elementAtOrNull(1);
  if (lintRulesDirPath == null ||
      !fileSystem.isDirectorySync(lintRulesDirPath)) {
    throw ArgumentError(
        'The input value must be a valid path to an existing directory.');
  }

  final File diffPathListFile = fileSystem.file(diffPathListFilePath);
  final Directory lintRulesDir = fileSystem.directory(lintRulesDirPath);

  final container = ProviderContainer(
    overrides: [
      lintRulesDirProvider.overrideWithValue(lintRulesDir),
      versionPathsFileProvider.overrideWithValue(diffPathListFile),
    ],
  );
  try {
    final exitStatus = await checkLintRulesIdentity(container);
    return exitStatus;
  } finally {
    container.dispose();
  }
}

@visibleForTesting
Future<ExitStatus> checkLintRulesIdentity(ProviderContainer container) async {
  final diffVersionService = container.read(diffVersionServiceProvider);
  final dartIdentityVerificationService =
      container.read(dartIdentityVerificationServiceProvider);
  final flutterIdentityVerificationService =
      container.read(flutterIdentityVerificationServiceProvider);

  try {
    final diffVersions = diffVersionService.getDiffVersion();
    final isDartIdentity = await diffVersions.dart
        .asyncEvery(dartIdentityVerificationService.isIdenticalLintRule);
    final isFlutterIdentity = await diffVersions.flutter
        .asyncEvery(flutterIdentityVerificationService.isIdenticalLintRule);

    if (isDartIdentity && isFlutterIdentity) {
      return ExitStatus.success;
    }
    return ExitStatus.warnings;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  }
}

extension AsyncEvery<E> on Set<E> {
  Future<bool> asyncEvery(Future<bool> Function(E element) test) async {
    bool isPass = true;
    for (E element in this) {
      isPass &= await test(element);
    }
    return isPass;
  }
}
