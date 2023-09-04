import 'dart:io';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:update_lint_rules/src/models/github_token.dart';

part 'github_client.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
GitHubToken gitHubToken(GitHubTokenRef ref) {
  final token = Platform.environment['GITHUB_TOKEN'];
  if (token == null) {
    throw ArgumentError('The `GITHUB_TOKEN` environment variable is required.');
  }
  return GitHubToken.withBearerToken(token);
}

@Riverpod(keepAlive: true, dependencies: [gitHubToken])
GitHubClient gitHubClient(GitHubClientRef ref) {
  final gitHubToken = ref.watch(gitHubTokenProvider);
  final gitHubClient = GitHubClient(Client(), gitHubToken);
  ref.onDispose(gitHubClient.close);
  return gitHubClient;
}

class GitHubClient extends BaseClient {
  GitHubClient(this._inner, this._gitHubToken);

  final Client _inner;
  final GitHubToken _gitHubToken;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers['Accept'] = 'application/vnd.github+json';
    request.headers['Authorization'] = _gitHubToken.headerValue;
    request.headers['X-GitHub-Api-Version'] = '2022-11-28';
    return _inner.send(request).timeout(const Duration(seconds: 3));
  }

  @override
  void close() => _inner.close();
}
