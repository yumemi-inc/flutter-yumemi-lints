import 'package:pub_semver/pub_semver.dart';

final _versionRegExp = RegExp(r'^(\d+)\.(\d+)$');

// Version.parse cannot be used if patch does not exist, so I created my own parse method.
Version parseStringToVersion(String versionString) {
  final match = _versionRegExp.firstMatch(versionString);
  if (match == null) {
    throw FormatException('Could not parse "$versionString".');
  }

  try {
    final major = int.parse(match[1]!);
    final minor = int.parse(match[2]!);
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
