# GET_STARTED
The yumemi_lints project has a multi-package structure.
Please install the necessary tools before making a contribution.

## 1. Install DVMx
[dvmx] is Dart version management tool.
1. Install dvmx globally. ( [install dvm] )
2. Execute the following command in the project root.
```bash
dvm use
```
3. Run the command `dvm dart --version` to check the version.


## 2. Install Melos
[Melos] is a tool that optimizes the workflow around managing multi-package repositories.

1. Install melos globally. ( [install melos] )
2. Run the following commands to verify that the dependencies are resolved.
```bash
melos bootstrap
```

## 3. Read README.md
Read the README.md of the respective tool or package.

## Optional
- Activate GitHub Copilot according to [COPILOT.md]

<!-- Links -->
[dvmx]: https://pub.dev/packages/dvmx
[install dvm]: https://pub.dev/packages/dvmx/install
[Melos]: https://pub.dev/packages/melos
[install melos]: https://pub.dev/packages/melos/install
[COPILOT.md]: https://github.com/yumemi-inc/flutter-yumemi-lints/blob/main/docs/COPILOT.md
