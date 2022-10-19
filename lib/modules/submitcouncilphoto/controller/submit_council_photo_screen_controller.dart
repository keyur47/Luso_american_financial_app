import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/helper/toast_helper.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/service/submit_council_photo_servicec.dart';

class SubmitCouncilScreenController extends GetxController with SingleGetTickerProviderMixin {
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

  TextEditingController searchSubmitCouncilScreenController = TextEditingController();
  TextEditingController uploadImageController = TextEditingController();
  RxString tAddTournamentLogo = ''.obs;
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isRegisterLoading = false.obs;

  Future<void> fileTeamLogo() async {
    try {
      var result = (await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      ));

      if (result != null) {
        tAddTournamentLogo.value = result.files.single.path.toString();
        update();
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log("error in filePick---->${e.toString()}");
    }
  }

  Future<void> submitCouncilUpload({
    required File fileUpload,
  }) async {
    try {
      isRegisterLoading.value = true;
      final result = await SubmitCouncilService.submitCouncil(fileUpload: fileUpload);
      if (result["status"] != null) {
        AppToast.toastMessage("${result["status"]}");
      } else {
        AppToast.toastMessage("${result["status"]}");
      }
    } catch (e, st) {
      isRegisterLoading.value = false;
      print("e:- $e st:- $st");
    } finally {
      isRegisterLoading.value = false;
    }
  }
}
