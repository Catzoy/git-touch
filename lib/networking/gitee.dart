import 'dart:convert';

import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/networking/client.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:http/http.dart' as http;

Future<http.Response> giteeFetch({
  required String url,
  required String method,
  Map<String, String>? queryParameters,
  String? token,
  Object? body,
}) {
  return fetchHttp(
    url: url,
    method: method,
    headers: {
      'Authorization': 'token ${token ?? activeAccountState.value!.token}',
    },
    queryParameters: queryParameters,
    body: body,
  );
}

Future login(GiteeAuth auth) async {
  final token = auth.token.trim();
  final res = await giteeFetch(
    url: 'https://gitee.com/api/v5/user',
    method: 'GET',
    token: token,
  );
  final info = json.decode(res.body);
  if (info['message'] != null) {
    throw info['message'];
  }
  final user = GiteeUser.fromJson(info);

  return Account(
    platform: PlatformType.gitee,
    domain: 'https://gitee.com',
    token: token,
    login: user.login!,
    avatarUrl: user.avatarUrl!,
  );
}

Future fetchGitee(
  String p, {
  requestType = 'GET',
  Map<String, dynamic> body = const {},
}) async {
  return giteeFetch(
    url: '${activeAccountState.value!.domain}/api/v5$p',
    method: requestType,
  ).then(jsonOf);
}

Future<DataWithPage> fetchGiteeWithPage(
  String path, {
  int? page,
  int? limit,
}) async {
  page ??= 1;
  limit ??= kPageSize;

  final res = await giteeFetch(
    url: '${activeAccountState.value!.domain}/api/v5$path',
    method: 'GET',
    queryParameters: {
      'page': page.toString(),
      'per_page': limit.toString(),
    },
  );
  final info = jsonOf(res);

  final totalPage = int.tryParse(res.headers['total_page'] ?? '');
  final totalCount =
      int.tryParse(res.headers['total_count'] ?? '') ?? kTotalCountFallback;

  return DataWithPage(
    data: info,
    cursor: page + 1,
    hasMore: totalPage == null ? info.length > limit : totalPage > page,
    total: totalCount,
  );
}
