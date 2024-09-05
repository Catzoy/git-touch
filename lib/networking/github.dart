import 'dart:convert';

import 'package:http/http.dart';
import 'package:signals/signals.dart';
import 'package:universal_io/io.dart';

final rawGraphQlGithubClientFactory = readonlySignalContainer<Client, String>(
  (_) => signal(Client()),
  cache: true,
);

Future<dynamic> rawQueryGithub({
  required String token,
  required String query,
  Duration timeout = const Duration(seconds: 10),
}) async {
  final client = rawGraphQlGithubClientFactory(token).value;
  final res = await client
      .post(
        Uri.parse('https://api.github.com/graphql'),
        headers: {
          HttpHeaders.authorizationHeader: 'token $token',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: json.encode({'query': query}),
      )
      .timeout(timeout);

  final data = json.decode(res.body);

  if (data['errors'] != null) {
    throw data['errors'][0]['message'];
  }

  return data['data'];
}
