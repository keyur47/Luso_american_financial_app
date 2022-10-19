import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/model/agent_model.dart';
import 'package:luso_american_financial/modules/findagent/service/find_agent_service.dart';

class FindAgentScreenController extends GetxController {
  TextEditingController FindAgentController = TextEditingController();
  RxList format = [
    "10 Miles",
    "20 Miles",
    "50 Miles",
    "100 Miles",
    "1000 Miles",
  ].obs;
  RxString formatDropDownValue = ''.obs;
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  Rx<FindAgentsModel> findAgentsModel = FindAgentsModel().obs;
  RxList<Output> searchData =<Output> [].obs;
  RxBool isLoading = false.obs;


  Future findAgent() async {
    try {
      isLoading.value = true;
      findAgentsModel.value = await FindAgentService.findAgentService();
    } catch (e, st) {
      log("e:- $e,st:-$st");
    } finally {
      isLoading.value = false;
    }
  }


}
