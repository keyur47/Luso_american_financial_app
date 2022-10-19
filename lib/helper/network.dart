import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:luso_american_financial/utils/exception/app_exception.dart';

class NetworkAPICall {
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();

  static const String BASE_URL = 'https://reqres.in/api/';

  Future<dynamic> post(String url, {dynamic body, Map<String, String>? header}) async {
    final client = http.Client();
    try {
      final String fullURL = BASE_URL + url;
      log('API Url: $fullURL', level: 1);
      log('API body: $body');
      log('API header: ${header}');

      final response = await client.post(Uri.parse(fullURL), body: body, headers: header);

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body.toString()}');

      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? header, bool isToken = true}) async {
    final client = http.Client();
    try {
      final String fullURL = BASE_URL + url;
      log('API Url: $fullURL');
      log('API header: $header');
      final response = await client.get(Uri.parse(fullURL), headers: header);
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      return checkResponse(response);
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  dynamic checkResponse(http.Response response) {
    try {
      switch (response.statusCode) {
        case 200:
          try {
            if (response.body.isEmpty) {
              throw AppException(message: 'Response body is empty', errorCode: 0);
            }
            return jsonDecode(response.body);
          } catch (e) {
            rethrow;
          }
        default:
          try {
            if (response.body.isEmpty) {
              throw AppException(message: 'Response body is empty', errorCode: response.statusCode);
            }
            final Map<String, dynamic> data = jsonDecode(response.body);
            throw AppException(message: "error : ${data['Error']}", errorCode: response.statusCode);
          } catch (e) {
            rethrow;
          }
      }
    } catch (e) {
      rethrow;
    }
  }

}

