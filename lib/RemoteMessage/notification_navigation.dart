import 'package:get/get.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';

class NavigationUtils {
  static const String home = 'Home';
  static String notificationNavigationName = '';

  static void navToHomeScreen() async {
    print('navToHomeScreen');
    await Future.delayed(Duration(milliseconds: 300));
    if (Get.currentRoute != Routes.dashBordScreen) {
      await Get.toNamed(Routes.dashBordScreen);
    }
  }

  static void navigationSwitch(Map<dynamic, dynamic> payload) {
    print('Notification Redirect Data: ${payload.toString()}');
    String? screenName = payload['redirect'];
    switch (screenName) {
      case home:
        navToHomeScreen();
        break;
    }
  }
}

/// dashboard onInit
void _checkNotificationNavigation() {
  Future.delayed(Duration(milliseconds: 300)).then((value) {
    if (NavigationUtils.notificationNavigationName.isNotEmpty) {
      Map<dynamic, dynamic> payload = {
        'redirect': NavigationUtils.notificationNavigationName,
      };
      NavigationUtils.navigationSwitch(payload);
      NavigationUtils.notificationNavigationName = '';
    }
  });
}
