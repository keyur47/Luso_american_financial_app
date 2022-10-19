import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/utils/appconfig.dart';



class SubmitCouncilService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  SubmitCouncilService();

  static Future<dynamic> submitCouncil({
    required File fileUpload,
  }) async {
    try {
      var body =
          json.encode({'eventName': 'uploadpostimage','filetoupload': fileUpload});
      final headers = {'Content-Type': 'application/json'};
      final response = await _networkAPICall.post(AppConfig.postApi, body: body, header: headers);
      log("contactUs Result--->$response");
      return response;
    } catch (e, st) {
      log("error :- $e $st");
      rethrow;
    }
  }















}
