/// A parsed semantic version number. However, only the major and minor
/// versions are processed.
class Version implements Comparable<Version> {
  const Version(this._major, this._minor)
      : assert(_major >= 0, 'Major version must be non-negative.'),
        assert(_minor >= 0, 'Minor version must be non-negative.');

  factory Version.parse(String text) {
    if (text.contains('<') && !text.contains('>=')) {
      throw MinimumVersionMissingException(text);
    }

    RegExp regExp;
    if (text.contains('>=')) {
      regExp = RegExp(r'>=\s*(\d+)\.(\d+)');
    } else {
      regExp = RegExp(r'\^?(\d+)\.(\d+)');
    }
    final match = regExp.firstMatch(text);

    if (match == null) {
      throw UnsupportedVersionFormatException(text);
    }

    final major = int.parse(match[1]!);
    final minor = int.parse(match[2]!);
    return Version(major, minor);
  }

  final int _major;
  final int _minor;

  @override
  bool operator ==(Object other) =>
      other is Version && _major == other._major && _minor == other._minor;

  @override
  int get hashCode => _major ^ _minor;

  @override
  int compareTo(Version other) {
    if (_major != other._major) {
      return _major.compareTo(other._major);
    }
    if (_minor != other._minor) {
      return _minor.compareTo(other._minor);
    }
    return 0;
  }

  @override
  String toString() => '$_major.$_minor';
}

abstract class _VersionParseException extends FormatException {
  const _VersionParseException({
    required String text,
    required String message,
  }) : super(
          'Could not parse `$text`. $message',
        );
}

class MinimumVersionMissingException extends _VersionParseException {
  const MinimumVersionMissingException(String text)
      : super(
          text: text,
          message: 'The minimum version must be specified if the version '
              'is in range format.',
        );
}

class UnsupportedVersionFormatException extends _VersionParseException {
  const UnsupportedVersionFormatException(String text)
      : super(
          text: text,
          message:
              'Only version formats matching the following regular expressions '
              r'are supported: `>=\s*(\d+)\.(\d+)` or `\^?(\d+)\.(\d+)`.',
        );
}
