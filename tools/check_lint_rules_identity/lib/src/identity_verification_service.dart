import 'package:check_lint_rules_identity/src/version_data_source.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';
import 'package:collection/collection.dart';

part 'identity_verification_service.g.dart';

@riverpod
DartIdentityVerificationService dartIdentityVerificationService(
    DartIdentityVerificationServiceRef ref) {
  final dartVersionDataSource = ref.watch(dartVersionDataSourceProvider);
  return DartIdentityVerificationService(dartVersionDataSource);
}

@riverpod
FlutterIdentityVerificationService flutterIdentityVerificationService(
    FlutterIdentityVerificationServiceRef ref) {
  final flutterVersionDataSource = ref.watch(flutterVersionDataSourceProvider);
  return FlutterIdentityVerificationService(flutterVersionDataSource);
}

class DartIdentityVerificationService extends IdentityVerificationService {
  const DartIdentityVerificationService(
      DartVersionDataSource dartVersionDataSource)
      : super(dartVersionDataSource);

  @override
  bool _isEqualContent(String yamlAsString1, String yamlAsString2) =>
      yamlAsString1 == yamlAsString2;
}

class FlutterIdentityVerificationService extends IdentityVerificationService {
  const FlutterIdentityVerificationService(
      FlutterVersionDataSource flutterVersionDataSource)
      : super(flutterVersionDataSource);

  @override
  bool _isEqualContent(String yamlAsString1, String yamlAsString2) {
    final yaml1 = loadYaml(yamlAsString1);
    final yaml2 = loadYaml(yamlAsString2);
    final linterData1 = yaml1['linter'] as Map;
    final linterData2 = yaml2['linter'] as Map;

    return DeepCollectionEquality().equals(linterData1, linterData2);
  }
}

abstract class IdentityVerificationService {
  const IdentityVerificationService(this._versionDataSource);
  final VersionDataSource _versionDataSource;

  Future<bool> isIdenticalLintRule(Version target) async {
    final previousVersion = await _versionDataSource.getPreviousVersion(target);

    print('''${_versionDataSource.type.name} version comparison:
      target=$target
      previous=$previousVersion
      ''');

    final targetLint = await _versionDataSource.readAllYamlAsString(target);
    final previousLint =
        await _versionDataSource.readAllYamlAsString(previousVersion);

    return _isEqualContent(targetLint, previousLint);
  }

  bool _isEqualContent(String yamlAsString1, String yamlAsString2);
}
