import 'dart:convert';
import 'dart:developer';

import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/utils/appconfig.dart';



class ContactUsService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  ContactUsService();

  static Future<dynamic> contactUs({
    required String firstName,
    required String lastName,
    required String email,
    required String mobile,
    required String msg,
  }) async {
    try {
      var body =
          json.encode({'eventName\n': 'contact_us', 'firstname': firstName, 'lastname': lastName, 'email': email, 'phone': mobile, 'msg': msg});
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
