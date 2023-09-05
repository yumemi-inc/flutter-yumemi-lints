import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_token.freezed.dart';

@freezed
sealed class GitHubToken with _$GitHubToken {
  const GitHubToken._();

  const factory GitHubToken.withToken(String token) = _GitHubTokenWithToken;

  const factory GitHubToken.withBearerToken(String token) =
      _GitHubTokenWithBearerToken;

  String get headerValue => switch (this) {
        _GitHubTokenWithToken(token: final token) => 'token $token',
        _GitHubTokenWithBearerToken(token: final token) => 'Bearer $token',
      };
}
