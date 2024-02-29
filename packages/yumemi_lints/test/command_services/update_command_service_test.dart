import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';
import 'package:yumemi_lints/src/command_services/update_command_service.dart';

void main() {
  const updateCommandService = UpdateCommandService();
  test('get dart version', () {
    // arrange
    const input =
        'Dart SDK version: 3.2.6 (stable) (Wed Jan 24 13:41:58 2024 +0000) on "macos_arm64"';

    // act
    final version = updateCommandService.getDartVersion(input);

    // assert
    expect(version, Version(3, 2, 6));
  });

  // 関数毎にグループ化して例外時もテストするといいかも
  test('get flutter version', () {
    // arrange
    const input = '''
Flutter 3.16.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2e9cb0aa71 (3 months ago) • 2023-12-11 14:35:13 -0700
Engine • revision 54a7145303
Tools • Dart 3.2.3 • DevTools 2.28.4''';

    // act
    final version = updateCommandService.getFlutterVersion(input);

    // assert
    expect(version, Version(3, 16, 4));
  });
}