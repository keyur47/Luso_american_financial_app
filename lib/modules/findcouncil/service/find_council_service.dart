import 'dart:convert';
import 'dart:developer';
import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/model/council_model.dart';
import 'package:luso_american_financial/utils/appconfig.dart';

class FindCouncilService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<List<FindCouncilModel>> findAgentService() async {
    try {
      final result = await _networkAPICall.get(AppConfig.getCouncil);
      log("FindCouncilModel${result}");
      return findCouncilModelFromJson(jsonEncode(result));
    } catch (e, st) {
      print("FindCouncil_Error:-$e ,$st");
      rethrow;
    }
  }
}
