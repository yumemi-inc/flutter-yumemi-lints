import 'package:pub_semver/pub_semver.dart';

extension VersionExt on Version {
  String get excludePatchVersion => '$major.$minor';
}
