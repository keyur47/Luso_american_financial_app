import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/utils/appconfig.dart';

class SubmitCouncilService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  SubmitCouncilService();

  static Future<dynamic> submitCouncil({
    required String fileUpload,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('https://luso-american.org/api/image_api.php'));
      request.fields.addAll({'eventName': 'uploadpostimage'});
      request.files.add(await http.MultipartFile.fromPath('filetoupload', fileUpload));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final result = await response.stream.bytesToString();
        print("${result}");
        return jsonDecode(result);
      } else {
        final result = response.reasonPhrase;
        print("error:-${result}");
        return result;
      }
    } catch (e, st) {
      log("error :- $e $st");
    }

    // try {
    //   var body =
    //       json.encode({'eventName': 'uploadpostimage','filetoupload': fileUpload});
    //   final headers = {'Content-Type': 'application/json'};
    //   final response = await _networkAPICall.post(AppConfig.postApi, body: body, header: headers);
    //   log("contactUs Result--->$response");
    //   return response;
    // } catch (e, st) {
    //   log("error :- $e $st");
    //   rethrow;
    // }
  }
}
