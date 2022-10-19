import 'package:get/get.dart';
import 'package:luso_american_financial/modules/calendar/controller/calendar_screen_controller.dart';
import 'package:luso_american_financial/modules/contactus/controller/contactus_screen_controller.dart';
import 'package:luso_american_financial/modules/dashbord/controller/dashbord_screen_controller.dart';
import 'package:luso_american_financial/modules/findagent/controller/find_agent_screen_controller.dart';
import 'package:luso_american_financial/modules/findcouncil/controller/find_council_screen_controller.dart';
import 'package:luso_american_financial/modules/notifications/controller/notifications_screen_controller.dart';
import 'package:luso_american_financial/modules/onboarding/controller/onboarding_screen_controller.dart';
import 'package:luso_american_financial/modules/splash/controller/splash_screen_controller.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/controller/submit_council_photo_screen_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
    Get.put<OnboardingScreenController>(OnboardingScreenController());
    Get.put<DashBordScreenController>(DashBordScreenController());
    Get.put<CalendarScreenController>(CalendarScreenController());
    Get.put<NotificationsScreenController>(NotificationsScreenController());
    Get.put<FindAgentScreenController>(FindAgentScreenController());
    Get.put<FindCouncilScreenController>(FindCouncilScreenController());
    Get.put<SubmitCouncilScreenController>(SubmitCouncilScreenController());
    Get.put<ContactUsScreenController>(ContactUsScreenController());
  }
}
