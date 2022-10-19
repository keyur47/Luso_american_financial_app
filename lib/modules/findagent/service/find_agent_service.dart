import 'dart:convert';
import 'dart:developer';
import 'package:luso_american_financial/helper/network_helper.dart';
import 'package:luso_american_financial/model/agent_model.dart';
import 'package:luso_american_financial/utils/appconfig.dart';

class FindAgentService {
  static final NetworkAPICall _networkAPICall = NetworkAPICall();

  static Future<FindAgentsModel> findAgentService() async {
    try {
      final result = await _networkAPICall.get(AppConfig.agents);
      log("FindAgentsModel${findAgentsModelFromJson(jsonEncode(result))}");
      return findAgentsModelFromJson(jsonEncode(result));
    } catch (e, st) {
      print("Agents_Error:-$e ,$st");
      rethrow;
    }
  }


}
