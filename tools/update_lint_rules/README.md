# Lint Rules Updater CLI

The CLI is a tool designed to create lint rules tailored for Dart and Flutter, with support for different versions.

It currently supports lint rule generation for Dart 2.17.0+ and Flutter 3.0.0+.

## Get Started

### 1. Install Dart SDK

Before using this tool, make sure you have the Dart SDK installed. You can follow the instructions in the official
documentation to install the Dart SDK and set up the `dart` command:

[Install Dart SDK]

> **Note**
> Ensure that your Dart SDK version is `3.1.0`.

### 2. Install Dependencies

After installing the Dart SDK, you need to install the project dependencies using the following command:

```shell
dart pub get
```

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
