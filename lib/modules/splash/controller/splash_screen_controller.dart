import 'dart:async';

import 'package:get/get.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';
import 'package:luso_american_financial/utils/navigation_utils/navigation.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () {
        final value = AppPreference.getInt() ?? 0;
        value == 1
            ? Navigation.popAndPushNamed(Routes.dashBordScreen)
            : Navigation.popAndPushNamed(Routes.onboardingScreen);
      },
    );
  }
}
