import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/helper/toast_helper.dart';
import 'package:luso_american_financial/model/image_upload_model.dart';
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
        allowMultiple: false, type: FileType.image,
        // allowedExtensions: ["PNG"],
      ));

      if (result != null) {
        tAddTournamentLogo.value = result.files.single.path.toString();
        log('tAddTournamentLogo${tAddTournamentLogo.value}');
        update();
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log("error in filePick---->${e.toString()}");
    }
  }

  Future<ImageUploadModel?> submitCouncilUpload({
    required String fileUpload,
  }) async {
    try {
      isRegisterLoading.value = true;
      final result = await SubmitCouncilService.submitCouncil(fileUpload: fileUpload);
      if (result["data"] != "") {
        AppToast.toastMessage("${result["message"]}");
      } else {
        print("result2:-${result}");
        AppToast.toastMessage("${result["message"]}");
      }
    } catch (e, st) {
      isRegisterLoading.value = false;
      print("e:- $e st:- $st");
    } finally {
      isRegisterLoading.value = false;
    }
  }
}
