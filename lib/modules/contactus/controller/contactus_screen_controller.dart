import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luso_american_financial/helper/toast_helper.dart';
import 'package:luso_american_financial/modules/contactus/service/contactus_servicec.dart';

class ContactUsScreenController extends GetxController with SingleGetTickerProviderMixin {
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

  TextEditingController searchContactUsController = TextEditingController();
  TextEditingController fullNameContactUsController = TextEditingController();
  TextEditingController lastNameContactUsController = TextEditingController();
  TextEditingController emailContactUsController = TextEditingController();
  TextEditingController phoneNumberContactUsController = TextEditingController();
  TextEditingController messagesContactUsController = TextEditingController();
  RxBool isRegisterLoading = false.obs;
  final signUpFormKey = GlobalKey<FormState>();

  final Completer<GoogleMapController> _controller = Completer();

  GoogleMapController? mapController;
  GoogleMapController? mapController1;
  Map<PolylineId, Polyline> polylines = {};
  RxBool isLoaded = false.obs;

  Future<void> Contact_Us({
    required String mobile,
    required String firstName,
    required String lastName,
    required String email,
    required String msg,
  }) async {
    try {
      isRegisterLoading.value = true;
      final result = await ContactUsService.contactUs(
        mobile: mobile,
        email: email,
        msg: msg,
        firstName: firstName,
        lastName: lastName,
      );
      if (result["status"] != null) {
        // Navigation.pushNamed(Routes.dashBordScreen);
        AppToast.toastMessage("success");
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
