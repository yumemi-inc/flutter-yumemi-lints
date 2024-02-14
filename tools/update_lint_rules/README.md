# Lint Rules Updater CLI

The CLI is a tool designed to create lint rules tailored for Dart and Flutter, with support for different versions.

It currently supports lint rule generation for Dart 2.17+ and Flutter 3.0+.

## Get Started

Please Read [GET_STARTED.md].

## Usage

> **Note**
> This package is intended for use exclusively within the GitHub Actions workflow of
> [yumemi-inc/flutter-yumemi-lints] and is not published on [Pub.dev].

To generate lint rules, execute the following command:

```shell
dart run bin/update_lint_rules.dart <output-dir-path>
```

Replace `<output-dir-path>` with the path to an existing directory where you want to store the generated lint rules.

<!-- Links -->

[Install Dart SDK]: https://dart.dev/get-dart

[yumemi-inc/flutter-yumemi-lints]: https://github.com/yumemi-inc/flutter-yumemi-lints

[Pub.dev]: https://pub.dev/

[GET_STARTED.md]: https://github.com/yumemi-inc/flutter-yumemi-lints/blob/main/docs/contributing/GET_STARTED.md
