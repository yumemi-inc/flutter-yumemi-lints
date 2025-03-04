class Yaml {
  const Yaml._(this.yamlMap);

  // Convert and parse the file system into a Yaml file,
  // obtain a YamlMap, and then create a Yaml object.
  factory Yaml.parse(String fileContent) {
    final lines = fileContent.split('\n');
    // A stack of maps to manage the current nesting level.
    final mapStack = <Map<String, dynamic>>[{}];
    final currentMap = <String, dynamic>{};

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) {
        continue;
      }

      // Determine indentation by counting leading spaces.
      final indent = line.length - line.trimLeft().length;
      // If the stack's depth is deeper than the current indent,
      // pop until it matches.
      while (mapStack.length > indent) {
        mapStack.removeLast();
      }

      // Only process the line if it contains a colon.
      if (trimmed.contains(':')) {
        // Split the line into a key and value
        // (joining the rest in case there are multiple colons).
        final parts = trimmed.split(':');
        final key = parts[0].trim();
        final value = parts.sublist(1).join(':').trim();

        // If the value is empty, treat the key as a nested map.
        if (value.isEmpty) {
          final newMap = <String, dynamic>{};
          currentMap[key] = newMap;
          mapStack.add(newMap);
        } else {
          if (mapStack.isNotEmpty) {
            final lastMap = mapStack.last;
            lastMap[key] = value;
            currentMap[lastMap.keys.first] = lastMap;
          } else {
            // Otherwise, assign the value as a string.
            currentMap[key] = value;
          }
        }
      }
    }
    return Yaml._(currentMap);
  }

  final YamlMap yamlMap;
}

typedef YamlMap = Map<String, dynamic>;
