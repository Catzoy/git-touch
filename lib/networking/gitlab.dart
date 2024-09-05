import 'dart:convert';

import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

Future<http.Response> gitlabFetch({
  required String url,
  required String method,
  Object? body,
  String? token,
}) {
  final request = http.Request(method, Uri.parse(url))
    ..headers['Private-Token'] = token ?? activeAccountState.value!.token;
  if (body != null) {
    assert(method == 'POST' || method == 'PUT' || method == 'PATCH');
    request
      ..headers[HttpHeaders.contentTypeHeader] = 'application/json'
      ..body = jsonEncode(body);
  }
  return http.Client()
      .send(request)
      .then((value) => http.Response.fromStream(value));
}

Future<String> fetchWithGitlabToken(String p) async {
  final res = await gitlabFetch(url: p, method: 'GET');
  return res.body;
}

dynamic _parseGitlabBody(http.Response res) {
  final info = json.decode(utf8.decode(res.bodyBytes));

  if (info is Map && info['message'] != null) {
    throw info['message'];
  }

  if (info['error'] != null) {
    throw info['error'] + '. ' + (info['error_description'] ?? '');
  }

  return info;
}

Future<dynamic> fetchGitlab(
  String p, {
  Map<String, dynamic>? body,
}) {
  final activeAccount = activeAccountState.value!;
  return gitlabFetch(
    url: activeAccount.buildGitlabUrl(p),
    method: body == null ? 'GET' : 'POST',
    body: body,
  ).then(_parseGitlabBody);
}

Future<DataWithPage> fetchGitlabWithPage(String p) async {
  final activeAccount = activeAccountState.value!;
  final res = await gitlabFetch(
    url: activeAccount.buildGitlabUrl(p),
    method: 'GET',
  );
  final next = int.tryParse(
    res.headers['X-Next-Pages'] ?? res.headers['x-next-page'] ?? '',
  );

  return DataWithPage(
    data: _parseGitlabBody(res),
    cursor: next ?? 1,
    hasMore: next != null,
    total:
        int.tryParse(res.headers['X-Total'] ?? res.headers['x-total'] ?? '') ??
            kTotalCountFallback,
  );
}

Future<Account> login(GitlabAuth auth) async {
  final domain = auth.domain.trim();
  final token = auth.token.trim();
  final ingo = await gitlabFetch(
    url: '$domain/api/v4/user',
    method: 'GET',
    token: token,
  ).then(_parseGitlabBody);
  final user = GitlabUser.fromJson(ingo);
  return Account(
    platform: PlatformType.gitlab,
    domain: domain,
    token: token,
    login: user.username!,
    avatarUrl: user.avatarUrl!,
    gitlabId: user.id,
  );
}

extension on Account {
  String buildGitlabUrl(String path) => '$domain/api/v4$path';
}
