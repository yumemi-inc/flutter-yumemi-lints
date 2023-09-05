import 'package:update_lint_rules/src/models/dart_sdk_release.dart';
import 'package:update_lint_rules/src/models/flutter_sdk_release.dart';
import 'package:update_lint_rules/src/services/sdk_service.dart';

class FakeSdkService implements SdkService {
  @override
  Future<Iterable<DartSdkRelease>> getDartSdkReleases() async {
    return [];
  }

  @override
  Future<Iterable<FlutterSdkRelease>> getFlutterSdkReleases() async {
    return [];
  }
}
