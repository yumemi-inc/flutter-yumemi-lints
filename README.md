[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

## Overview

Provides a set of lint rules recommended by YUMEMI Inc. for Dart and Flutter projects. These rules help enhance code quality and maintainability by ensuring adherence to best practices and style conventions. Follow the steps below to integrate and customize these lint rules into your project.

## Usage

### 1. Installation

In a terminal, located at the root of your package, run this command:

```shell
dart pub add dev:yumemi_lints
```

### 2. Setting

In a terminal, located at the root of your package, run this command:

```shell
dart run yumemi_lints update
```

The above command will automatically update the lint rules to the recommended.yaml recommended by Yumemi Inc. according to the version of Flutter or Dart SDK used in the project.

This can be used when introducing yumemi_lints or when updating the Flutter or Dart sdk version to avoid the hassle of manually updating lints.

### 3. Configuration

#### Basic

For basic lint rule configuration, include lint rules recommended by YUMEMI Inc. in your `analysis_options.yaml` file as shown below:

```yaml:analysis_options.yaml
include: package:yumemi_lints/dart/2.17/recommended.yaml
```

Please note that you need to adjust the file path accordingly based on the Dart or Flutter version your project is using.

#### Customization

If you want to customize lint rules, include all lint rules in your `analysis_options.yaml` file as shown below:

```yaml:analysis_options.yaml
include: package:yumemi_lints/dart/2.17/all.yaml

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

## How to contribute

See [Contributor Guide] for contributing conventions.

### Contributors

<table>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/blendthink>
            <img src=https://avatars.githubusercontent.com/u/32213113?v=4 width="100;"  alt=blendthink/>
            <br />
            <sub style="font-size:14px"><b>blendthink</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/morikann>
            <img src=https://avatars.githubusercontent.com/u/70502790?v=4 width="100;"  alt=Kanta Mori/>
            <br />
            <sub style="font-size:14px"><b>Kanta Mori</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/Yamasaki-pan961>
            <img src=https://avatars.githubusercontent.com/u/54800851?v=4 width="100;"  alt=Yamasaki-pan961/>
            <br />
            <sub style="font-size:14px"><b>Yamasaki-pan961</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/masa-futa>
            <img src=https://avatars.githubusercontent.com/u/87967842?v=4 width="100;"  alt=masa-futa/>
            <br />
            <sub style="font-size:14px"><b>masa-futa</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/trm11tkr>
            <img src=https://avatars.githubusercontent.com/u/89247188?v=4 width="100;"  alt=trm11tkr/>
            <br />
            <sub style="font-size:14px"><b>trm11tkr</b></sub>
        </a>
    </td>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/K9i-0>
            <img src=https://avatars.githubusercontent.com/u/90010509?v=4 width="100;"  alt=K9i - Kota Hayashi/>
            <br />
            <sub style="font-size:14px"><b>K9i - Kota Hayashi</b></sub>
        </a>
    </td>
</tr>
<tr>
    <td align="center" style="word-wrap: break-word; width: 150.0; height: 150.0">
        <a href=https://github.com/YumNumm>
            <img src=https://avatars.githubusercontent.com/u/73390859?v=4 width="100;"  alt=Ryotaro Onoue/>
            <br />
            <sub style="font-size:14px"><b>Ryotaro Onoue</b></sub>
        </a>
    </td>
</tr>
</table>

<!-- Links -->

[Contributor Guide]: https://github.com/yumemi-inc/flutter-yumemi-lints/blob/main/docs/contributing/CONTRIBUTING.md
