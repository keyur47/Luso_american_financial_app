import 'package:get/get.dart';
import 'package:luso_american_financial/modules/calendar/bottom/calendar_bottom_navigation_bar_screen.dart';
import 'package:luso_american_financial/modules/calendar/presentation/calendar_screen.dart';
import 'package:luso_american_financial/modules/contactus/bottom/contactus_bottom_navigation_bar_screen.dart';
import 'package:luso_american_financial/modules/contactus/presentation/contactus_screen.dart';
import 'package:luso_american_financial/modules/dashbord/presentation/dashbord_screen.dart';
import 'package:luso_american_financial/modules/findagent/presentation/find_agent_screen.dart';
import 'package:luso_american_financial/modules/findcouncil/presentation/find_council_screen.dart';
import 'package:luso_american_financial/modules/notifications/bottom/notifications_bottom_navigation_bar_screen.dart';
import 'package:luso_american_financial/modules/notifications/presentation/notifications_screen.dart';
import 'package:luso_american_financial/modules/onboarding/presentation/onboarding_screen.dart';
import 'package:luso_american_financial/modules/splash/presentation/splash_screen.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/bottom/submit_council_bottom_navigation_bar_screen.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/presentation/submit_council_photo_screen.dart';


mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  // get started
  static const String splash = '/splash';
  static const String onboardingScreen = '/onboardingScreen';
  static const String dashBordScreen = '/dashBordScreen';
  static const String calendarScreen = '/calendarScreen';
  static const String notificationsTabBar = '/notificationsTabBar';
  static const String notificationsScreen = '/notificationsScreen';
  static const String submitCouncilScreen = '/submitCouncilScreen';
  static const String findAgentScreen = '/findAgentScreen';
  static const String findCouncilScreen = '/findCouncilScreen';
  static const String contactUsScreen = '/contactUsScreen';
  static const String contactsTabBar = '/contactsTabBar';
  static const String calendarTabBar = '/calendarTabBar';
  static const String submitCouncilTabBar = '/submitCouncilTabBar';

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splash,
      page: () =>  SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: onboardingScreen,
      page: () =>  OnboardingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: dashBordScreen,
      page: () =>  DashBordScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: calendarScreen,
      page: () =>   CalendarScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: notificationsTabBar,
      page: () =>  NotificationsTabBar(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: notificationsScreen,
      page: () =>  NotificationsScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: submitCouncilScreen,
      page: () =>  SubmitCouncilScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: findAgentScreen,
      page: () =>  FindAgentScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: findCouncilScreen,
      page: () =>  FindCouncilScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: contactUsScreen,
      page: () =>  ContactUsScreen(),
      transition: defaultTransition,
    ),
    //
    GetPage<dynamic>(
      name: contactsTabBar,
      page: () =>  ContactsTabBar(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: calendarTabBar,
      page: () =>  CalendarTabBar(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: submitCouncilTabBar,
      page: () =>  SubmitCouncilTabBar(),
      transition: defaultTransition,
    ),
  ];
}
