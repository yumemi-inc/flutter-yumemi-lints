## Overview

Provides a set of lint rules recommended by YUMEMI Inc. for Dart and Flutter projects. These rules help enhance code quality and maintainability by ensuring adherence to best practices and style conventions. Follow the steps below to integrate and customize these lint rules into your project.

## Usage

### 1. Installation

In a terminal, located at the root of your package, run this command:

```shell
dart pub add dev:yumemi_lints
```

### 2. Configuration

#### Basic

For basic lint rule configuration, include lint rules recommended by YUMEMI Inc. in your `analysis_options.yaml` file as shown below:

```yaml:analysis_options.yaml
include: package:yumemi_lints/dart/2.17.0/recommended.yaml
```

Please note that you need to adjust the file path accordingly based on the Dart or Flutter version your project is using.

#### Customization

If you want to customize lint rules, include all lint rules in your `analysis_options.yaml` file as shown below:

```yaml:analysis_options.yaml
include: package:yumemi_lints/dart/2.17.0/all.yaml

analyzer:
  errors:
    # By including all.yaml, some rules will conflict.
    # These warnings will be addressed within this file.
    included_file_warning: ignore

linter:
  rules:
    # Conflicts with enabling `avoid_types_on_closure_parameters`, `omit_local_variable_types`.
    always_specify_types: false

    # Conflicts with enabling `strict-raw-types`.
    avoid_annotating_with_dynamic: false

    # Conflicts with enabling `prefer_single_quotes`.
    prefer_double_quotes: false

    # Conflicts with enabling `avoid_final_parameters`.
    prefer_final_parameters: false

    # Conflicts with enabling `always_use_package_imports`.
    prefer_relative_imports: false

    # Conflicts with enabling `prefer_final_locals`.
    unnecessary_final: false
```

In the above example, we have customized various lint rules by adjusting their settings in the `analysis_options.yaml` file. You can modify these settings according to your project's specific needs and coding style preferences.
