# CHANGELOG

This project adheres to [Semantic Versioning 2.0.0].

Examples of version updates are as follows:

**Major Version Updates:**

- Added new lint rules to the existing set.
- Removed existing lint rules.
- Dropped support for older Dart and Flutter versions.

**Minor Version Updates:**

- Added support for newer Dart and Flutter versions.

**Patch Version Updates:**

- Bug fixes, including resolving issues where unintended versions of Lint rules were included in specific versions.

> [!NOTE]
> Changes to `tools/update_lint_rules` don't affect versioning.

## 2.2.1

### Improvements

- Changed to be independent of the `path` package.
- Changed to be independent of the `meta` package.
- Changed to be independent of the `pub_semver` package.
- Changed to be independent of the `yaml` package.

## 2.2.0

### Features

- Added support for Dart 3.5.x.
- Added support for Flutter 3.24.x.

### Improvements

- Output to use "categories" instead of "group".

## 2.1.0

- Added support for Dart 3.4.x.
- Added support for Flutter 3.22.x.

## 2.0.0

### Features

- Added update command to automatically update lint rules to match the Flutter or Dart sdk version of the project.
  - `dart run yumemi_lints update`

### Breaking Changes

- Removed the patch version from the directory name of Lint Rules.
- Changed the lint rule `use_setters_to_change_properties` to be deprecated.
- Changed the severity level of some lint rules to `error`.
  - `invalid_use_of_visible_for_testing_member`
  - `annotate_overrides`
  - `annotate_redeclares`
  - `avoid_implementing_value_types`
  - `avoid_renaming_method_parameters`
  - `avoid_shadowing_type_parameters`
  - `conditional_uri_does_not_exist`
  - `depend_on_referenced_packages`
  - `file_names`
  - `implementation_imports`
  - `library_names`
  - `matching_super_parameters`
  - `null_check_on_nullable_type_parameter`
  - `package_names`
  - `recursive_getters`
  - `void_checks`
- Fixed a bug in determining if a lint rule is exclusive to Flutter, and added/removed some lint rules in all.yaml for dart and flutter.
  - Added to Dart and removed from Flutter.
    - `avoid_print`
    - `prefer_const_constructors`
    - `prefer_const_constructors_in_immutables`
    - `prefer_const_declarations`
    - `prefer_const_literals_to_create_immutables`
  - Added to Flutter and removed from Dart.
    - `diagnostic_describe_all_properties`
    - `sized_box_shrink_expand`
    - `use_colored_box`
    - `use_decorated_box`

## 1.7.0

- Added support for Dart 3.3.0.
- Added support for Flutter 3.19.0.

## 1.6.0

- Added support for Dart 3.2.6.
- Added support for Flutter 3.16.9.

## 1.5.0

- Added support for Dart 3.2.5.
- Added support for Flutter 3.16.8.

## 1.4.0

- Added support for Dart 3.2.4.
- Added support for Flutter 3.16.5 to 3.16.7.

## 1.3.0

- Added support for Flutter 3.16.4.

## 1.2.0

- Added support for Dart 3.2.1 to 3.2.3.
- Added support for Flutter 3.16.1 to 3.16.3.

## 1.1.0

- Added support for Dart 3.1.4 to 3.2.0.
- Added support for Flutter 3.13.7 to 3.16.0.

## 1.0.0

- Initial version.

<!-- Links -->

[Semantic Versioning 2.0.0]: https://semver.org/spec/v2.0.0.html
