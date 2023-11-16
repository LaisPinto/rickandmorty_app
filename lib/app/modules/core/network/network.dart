import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  static final Network _instance = Network.internal();

  Network.internal();

  factory Network() => _instance;

  final JsonDecoder _decode = const JsonDecoder();
  int timeout = 90;

  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
        Uri.parse(url),
        headers: headers)
        .timeout(
          Duration(seconds: timeout),
        );
    if(response.statusCode == 200 || response.statusCode == 201) {
      return _decode.convert(utf8.decode(response.bodyBytes));
    } else {
      return null;
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
        encoding: encoding)
        .timeout(
          Duration(seconds: timeout),
        );
    if(response.statusCode == 200 || response.statusCode == 201) {
      return _decode.convert(response.body);
    } else {
      return null;
    }
  }

  Future<dynamic> put({
    required String url,
    Map<String, String>? headers,
    required dynamic body,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body
    )
    .timeout(Duration(seconds: timeout),
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      return _decode.convert(response.body);
    } else if(response.statusCode == 204) {
      return null;
    } else {
      return _decode.convert(response.body);
    }
  }

  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
    body,
    enconding,
  }) async {
    final responde = await http.Client().delete(
      Uri.parse(url),
      headers: headers,
      body: body,
      encoding: enconding,
    ).timeout(Duration(seconds: timeout));
    if(responde.statusCode >= 200 || responde.statusCode <= 299) {
      return null;
    } else {
      return _decode.convert(responde.body);
    }
  }

  Future<dynamic> patch({
    required String url,
    Map<String, String>? headers,
    body,
    encoding,
  }) async {
    final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: body,
        encoding: encoding)
        .timeout(Duration(seconds: timeout),
    );
    if(response.statusCode == 200 || response.statusCode == 201) {
      return _decode.convert(response.body);
    } else {
      return null;
    }
  }
}