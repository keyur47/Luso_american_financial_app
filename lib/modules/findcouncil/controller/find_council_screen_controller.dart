


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/model/council_model.dart';
import 'package:luso_american_financial/modules/findcouncil/service/find_council_service.dart';

class FindCouncilScreenController extends GetxController{
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
  RxBool isLoading = false.obs;

  RxList<FindCouncilModel> findCouncilModel = <FindCouncilModel>[].obs;
  RxList<FindCouncilModel> SearchResult = <FindCouncilModel>[].obs;


  Future findAgent() async {
    try {
      isLoading.value = true;
      findCouncilModel.value = await FindCouncilService.findAgentService();
      log("findCouncilModel.value:-${findCouncilModel.value.length}");
      isLoading.value = false;
    } catch (e, st) {
      log("e:- $e,st:-$st");
    }
  }

}
