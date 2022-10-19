


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/model/notifications_model.dart';
import 'package:luso_american_financial/modules/notifications/service/notifications_servicec.dart';


class NotificationsScreenController extends GetxController  with SingleGetTickerProviderMixin {
  late TabController tabController;



  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);


    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }



  TextEditingController searchNotificationController = TextEditingController();
  RxList<NotificationModel> notificationModal = <NotificationModel>[].obs;
  RxList<NotificationModel> SearchResult = <NotificationModel>[].obs;
  RxBool isLoading = false.obs;


  Future notification() async {
    try {
      isLoading.value = true;
      notificationModal.value = await NotificationService.notification();
      log("NotificationService.value:- ${notificationModal.value.length}");
    } catch (e, st) {
      log("e:- $e,st:-$st");
    }
    finally{
      isLoading.value = false;
    }
  }

}

