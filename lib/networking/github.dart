import 'dart:convert';

import 'package:ferry/ferry.dart' as ferry;
import 'package:git_touch/models/auth.dart';
import 'package:github/github.dart' as gh;
import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/http.dart' as http;
import 'package:signals/signals.dart';
import 'package:universal_io/io.dart';

const _apiPrefix = 'https://api.github.com';

final rawGraphQlGithubClientFactory =
    readonlySignalContainer<http.Client, String>(
  (_) => signal(http.Client()),
  cache: true,
);

final githubClientFactory = readonlySignalContainer<gh.GitHub, String>(
  (token) => signal(gh.GitHub(auth: gh.Authentication.withToken(token))),
  cache: true,
);

final graphQlGithubClientFactory =
    readonlySignalContainer<ferry.Client, String>(
  (token) {
    final graphQlClient = ferry.Client(
      link: HttpLink(
        '$_apiPrefix/graphql',
        defaultHeaders: {
          HttpHeaders.authorizationHeader: 'token $token',
        },
      ),
      // https://ferrygraphql.com/docs/fetch-policies#default-fetchpolicies
      defaultFetchPolicies: {
        ferry.OperationType.query: ferry.FetchPolicy.NetworkOnly,
      },
    );
    return signal(graphQlClient);
  },
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

gh.GitHub githubClient() {
  return githubClientFactory(
    activeAccountState.value!.token,
  ).value;
}

ferry.Client githubQlClient() {
  return graphQlGithubClientFactory(
    activeAccountState.value!.token,
  ).value;
}
