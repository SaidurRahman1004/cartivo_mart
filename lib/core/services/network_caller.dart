import 'dart:convert';
import 'dart:ui';

import 'package:logger/logger.dart';
import 'package:http/http.dart';

import '../models/network_response_model.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> headers;
  final VoidCallback onUnauthorize;

  NetworkCaller({required this.headers, required this.onUnauthorize});

  //Get Request
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);
      Response response = await get(uri, headers: headers);
      _logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1, //network error / internet off
        errorMessage: e.toString(),
      );
    }
  }

  //Post
  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUnauthorize();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: 'Un-authorize',
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1, //network error / internet off
        errorMessage: e.toString(),
      );
    }
  }

  //log Request
  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'URL: $url\n'
      'Body: $body',
    );
  }

  //Log Response
  void _logResponse(String url, Response response) {
    _logger.i(
      'URL: $url\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}
