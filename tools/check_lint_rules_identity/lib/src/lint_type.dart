enum LintType {
  dart,
  flutter,
}

extension ByNameOrNull<T extends Enum> on List<T> {
  T? byNameOrNull(String name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}
