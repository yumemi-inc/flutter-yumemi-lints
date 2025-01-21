import 'dart:io';

class Yaml {
  const Yaml._(this.yamlMap);

  // Convert and parse the file system into a Yaml file,
  // obtain a YamlMap, and then create a Yaml object.
  factory Yaml.parse(File file) {
    final lines = file.readAsStringSync().split('\n');
    final result = <String, dynamic>{};
    final stack = <String>[];
    var current = result;

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) {
        continue;
      }

      // Get parent element if there is an indent.
      final indent = line.length - line.trimLeft().length;
      while (stack.length > indent) {
        stack.removeLast();
        current = stack.isEmpty
            ? result
            : current['__parent__'] as Map<String, dynamic>;
      }

      if (trimmed.contains(':')) {
        final parts = trimmed.split(':');
        final key = parts[0].trim();
        final value = parts.sublist(1).join(':').trim();
        final newMap = <String, dynamic>{};
        // If value is empty,
        // create a new Map assuming a child element and add it to current.
        if (value.isEmpty) {
          current[key] = newMap;
          newMap['__parent__'] = current;
          stack.add(key);
          current = newMap;
        } else {
          current[key] = value;
        }
      }
    }
    // Delete the "__parent__" key.
    void cleanParent(Map<String, dynamic> map) {
      map.remove('__parent__');
      for (final value in map.values) {
        if (value is Map<String, dynamic>) {
          cleanParent(value);
        }
      }
    }

    cleanParent(result);
    return Yaml._(result);
  }

  final YamlMap yamlMap;
}

typedef YamlMap = Map<String, dynamic>;
