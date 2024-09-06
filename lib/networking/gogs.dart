import 'dart:convert';

import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gogs.dart';
import 'package:git_touch/networking/client.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:http/http.dart' as http;

Future<http.Response> gogsFetch({
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

Future login(GogsAuth auth) async {
  final domain = auth.domain.trim();
  final token = auth.token.trim();

  final res = await gogsFetch(
    url: '$domain/api/v1/user',
    method: 'GET',
    token: token,
  );
  final info = json.decode(res.body);
  if (info['message'] != null) {
    throw info['message'];
  }
  final user = GogsUser.fromJson(info);

  return Account(
    platform: PlatformType.gogs,
    domain: domain,
    token: token,
    login: user.username!,
    avatarUrl: user.avatarUrl!,
  );
}

Future fetchGogs(
  String p, {
  requestType = 'GET',
  dynamic body,
}) async {
  return gogsFetch(
    url: '${activeAccountState.value!.domain}/api/v1$p',
    method: requestType,
    body: body,
  ).then(jsonOf);
}

Future<DataWithPage> fetchGogsWithPage(
  String path, {
  int? page,
  int? limit,
}) async {
  page ??= 1;
  limit ??= kPageSize;
  final info = await gogsFetch(
    url: '${activeAccountState.value!.domain}/api/v1$path',
    method: 'GET',
    queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
    },
  ).then(jsonOf);
  return DataWithPage(
    data: info,
    cursor: page + 1,
    hasMore: info is List && info.isNotEmpty,
    total: int.tryParse(info['total'] ?? '') ?? kTotalCountFallback,
  );
}
