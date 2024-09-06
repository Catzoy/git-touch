import 'dart:convert';

import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitea.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

Future<http.Response> giteaFetch({
  required String url,
  required String method,
  Map<String, String>? queryParameters,
  String? token,
  Object? body,
}) {
  final uri = Uri.parse(url);
  if (queryParameters != null) {
    uri.queryParameters.addAll(queryParameters);
  }
  final request = http.Request(method, uri)
    ..headers['Authorization'] =
        'token ${token ?? activeAccountState.value!.token}';
  if (body != null) {
    assert(method == 'POST' || method == 'PATCH' || method == 'PUT');
    request
      ..body = jsonEncode(body)
      ..headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }
  return http.Client().send(request).then(http.Response.fromStream);
}

Future login(GiteaAuth auth) async {
  final domain = auth.domain.trim();
  final token = auth.token.trim();
  final res = await giteaFetch(
    url: '$domain/api/v1/user',
    method: 'GET',
    token: token,
  );
  final info = json.decode(res.body);
  if (info['message'] != null) {
    throw info['message'];
  }
  final user = GiteaUser.fromJson(info);

  return Account(
    platform: PlatformType.gitea,
    domain: domain,
    token: token,
    login: user.login!,
    avatarUrl: user.avatarUrl!,
  );
}

Future fetchGitea(
  String p, {
  String requestType = 'GET',
  dynamic body,
}) async {
  final res = await giteaFetch(
    url: '${activeAccountState.value!.domain}/api/v1$p',
    method: requestType,
    body: body,
  );
  if (body != null) {
    final info = json.decode(utf8.decode(res.bodyBytes));
    return info;
  }
  return;
}

Future<DataWithPage> fetchGiteaWithPage(
  String path, {
  int? page,
  int? limit,
}) async {
  page = page ?? 1;
  limit = limit ?? kPageSize;
  final res = await giteaFetch(
    url: '${activeAccountState.value!.domain}/api/v1$path',
    method: 'GET',
    queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
    },
  );
  final info = json.decode(utf8.decode(res.bodyBytes));

  return DataWithPage(
    data: info,
    cursor: page + 1,
    hasMore: info is List && info.isNotEmpty,
    total:
        int.tryParse(res.headers['x-total-count'] ?? '') ?? kTotalCountFallback,
  );
}
