import 'dart:convert';
import 'dart:developer';

import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/model/calendar_model.dart';
import 'package:luso_american_financial/utils/appconfig.dart';


class CalendarService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<List<CalendarModel>> calendarEvents() async {
    try {
      final result = await _networkAPICall.get(AppConfig.calendarEvents);
      log("CalendarModal result:-${calendarModelFromJson(jsonEncode(result))}");
      return calendarModelFromJson(jsonEncode(result));
    } catch (e, st) {
      print("CalendarModal--->Error ==>$e ,$st");
      rethrow;
    }
  }
}
