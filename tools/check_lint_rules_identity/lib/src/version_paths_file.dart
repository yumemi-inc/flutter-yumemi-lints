import 'package:file/file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'version_paths_file.g.dart';

@Riverpod(dependencies: [])
external File versionPathsFile(VersionPathsFileRef ref);
