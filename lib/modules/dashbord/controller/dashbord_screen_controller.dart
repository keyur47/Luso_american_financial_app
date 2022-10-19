import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/model/banner_media_model.dart';
import 'package:luso_american_financial/modules/dashbord/service/dashbord_service.dart';


class DashBordScreenController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  Rx<BannerMediaModal> bannerMediaModal = BannerMediaModal().obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    bannerMedia();
    super.onInit();
  }

  Future bannerMedia() async {
    try {
      isLoading.value = true;
      bannerMediaModal.value = await BannerMediaService.bannerMedia();
      log("calendarModal.value:- ${bannerMediaModal.value.toJson()}");
    } catch (e, st) {
      log("e:- $e,st:-$st");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
