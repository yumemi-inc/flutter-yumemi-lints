import 'dart:convert';

import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/clients/app_client.dart';
import 'package:update_lint_rules/src/models/dart_sdk_release.dart';

part 'sdk_service.g.dart';

@Riverpod(dependencies: [appClient])
SdkService sdkService(SdkServiceRef ref) {
  final appClient = ref.watch(appClientProvider);
  return SdkService(
    appClient: appClient,
  );
}

class SdkService {
  const SdkService({
    required AppClient appClient,
  }) : _appClient = appClient;

  final AppClient _appClient;

  Future<Iterable<DartSdkRelease>> getDartSdkReleases() async {
    final url = Uri.https(
      'storage.googleapis.com',
      '/storage/v1/b/dart-archive/o',
      {
        'delimiter': '/',
        'prefix': 'channels/stable/release/',
      },
    );

    final responseBody = await _appClient.read(url);

    final json = jsonDecode(responseBody) as Map<String, dynamic>;
    final prefixes = json['prefixes'] as List<dynamic>;

    final versions = prefixes
        .map((prefix) {
          if (prefix is! String) {
            return null;
          }
          return prefix.toVersionOrNull;
        })
        .nonNulls
        .where((v) {
          // The yumemi_lints package supports Flutter 3.0.0 and later.
          // Since Flutter 3.0.0 is associated with Dart SDK version 2.17.0, we
          // will narrow it down to Dart versions 2.17.0 and later.
          return v >= Version(2, 17, 0);
        });
    return versions.map((v) => DartSdkRelease(version: v));
  }
}

extension _ToVersionOrNull on String {
  Version? get toVersionOrNull {
    const nameVersion = 'version';
    final regex = RegExp(
      '''^channels/stable/release/(?<$nameVersion>\\d+\\.\\d+\\.\\d+)/\$''',
    );
    final match = regex.firstMatch(this);
    if (match == null) {
      return null;
    }
    final version = match.namedGroup(nameVersion)!;
    return Version.parse(version);
  }
}
