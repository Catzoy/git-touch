import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

Future<http.Response> fetchHttp({
  required String url,
  required String method,
  Map<String, String>? headers,
  Map<String, String>? queryParameters,
  Object? body,
}) {
  final uri = Uri.parse(url);
  if (queryParameters != null) {
    uri.queryParameters.addAll(queryParameters);
  }
  final request = http.Request(method, uri);
  if (headers != null) {
    request.headers.addAll(headers);
  }
  if (body != null) {
    assert(method == 'POST' || method == 'PATCH' || method == 'PUT');
    request
      ..body = jsonEncode(body)
      ..headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }
  return http.Client().send(request).then(http.Response.fromStream);
}

dynamic jsonOf(http.Response res) {
  if (res.bodyBytes.isNotEmpty) {
    return json.decode(utf8.decode(res.bodyBytes));
  }
}
