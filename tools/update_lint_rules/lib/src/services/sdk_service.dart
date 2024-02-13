import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/clients/app_client.dart';
import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';

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

    final json = jsonDecode(responseBody);
    if (json is! Map<String, dynamic>) {
      throw FormatException(
        'The type of `json` should be `Map<String, dynamic>`.',
      );
    }
    final prefixes = json['prefixes'];
    if (prefixes is! List<dynamic>) {
      throw FormatException(
        'The type of `prefixes` should be `List<dynamic>`.',
      );
    }

    final versions = prefixes
        .map((prefix) {
          if (prefix is! String) {
            throw FormatException(
              'The type of `prefix` should be `String`.',
            );
          }
          return prefix.toVersionOrNull;
        })
        .nonNulls
        .where((v) {
          // The yumemi_lints package supports Flutter 3.0.0 and later.
          // Since Flutter 3.0.0 is associated with Dart SDK version 2.17.0, we
          // will narrow it down to Dart versions 2.17.0 and later.
          // Do not create lint rule when patch version is changed.
          return v >= Version(2, 17, 0) && v.patch == 0;
        });
    return versions.map((v) => DartSdkRelease(version: v));
  }

  Future<Iterable<FlutterSdkRelease>> getFlutterSdkReleases() async {
    final url = Uri.https(
      'storage.googleapis.com',
      '/flutter_infra_release/releases/releases_linux.json',
    );

    final responseBody = await _appClient.read(url);

    final json = jsonDecode(responseBody);
    if (json is! Map<String, dynamic>) {
      throw FormatException(
        'The type of `json` should be `Map<String, dynamic>`.',
      );
    }
    final releases = json['releases'];
    if (releases is! List<dynamic>) {
      throw FormatException(
        'The type of `releases` should be `List<dynamic>`.',
      );
    }

    return releases
        .map((release) {
          if (release is! Map<String, dynamic>) {
            throw FormatException(
              'The type of `release` should be `Map<String, dynamic>`.',
            );
          }
          try {
            return FlutterSdkRelease.fromJson(release);
          } on CheckedFromJsonException catch (e) {
            if (e.key case 'version' || 'dart_sdk_version') {
              // Intentionally don't handle older formats of `version` and
              // `dart_sdk_version` values, and therefore, don't throw
              // exceptions in these cases.
              //
              // Unsupported formats:
              // - `version` such as `v1.12.13+hotfix.9` or `v1.16.3`
              // - `dart_sdk_version` such as `3.0.0 (build 3.0.0-417.1.beta)`
              return null;
            }
            rethrow;
          }
        })
        .nonNulls
        .where((release) {
          if (release.channel != FlutterChannel.stable) {
            return false;
          }

          // The yumemi_lints package supports Flutter 3.0.0 and later.
          // Do not create lint rule when patch version is changed.
          return release.version >= Version(3, 0, 0) &&
              release.version.patch == 0;
        });
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
