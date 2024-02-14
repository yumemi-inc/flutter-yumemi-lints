import 'package:pub_semver/pub_semver.dart';

// Version.parse cannot be used if patch does not exist, so I created my own parse method.
Version parseStringToVersion(String versionString) {
  final version = versionString.split('.');
  try {
    final major = int.parse(version[0]);
    final minor = int.parse(version[1]);
    const patch = 0;

    return Version(
      major,
      minor,
      patch,
    );
  } on FormatException catch (e) {
    throw FormatException('Could not parse "$versionString". ${e.message}');
  }
}
