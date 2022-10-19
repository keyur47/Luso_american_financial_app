import 'dart:convert';
import 'dart:developer';
import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/model/notifications_model.dart';
import 'package:luso_american_financial/utils/appconfig.dart';

class NotificationService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<List<NotificationModel>> notification() async {
    try {
      final result = await _networkAPICall.get(AppConfig.notification);
      return NotificationModelFromJson(jsonEncode(result));
    } catch (e, st) {
      print("CalendarModal--->Error ==>$e ,$st");
      rethrow;
    }
  }
}
