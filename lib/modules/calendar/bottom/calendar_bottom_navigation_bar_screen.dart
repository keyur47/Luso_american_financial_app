import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/modules/calendar/presentation/calendar_screen.dart';
import 'package:luso_american_financial/modules/contactus/presentation/contactus_screen.dart';
import 'package:luso_american_financial/modules/notifications/controller/notifications_screen_controller.dart';
import 'package:luso_american_financial/modules/notifications/presentation/notifications_screen.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/controller/submit_council_photo_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';

class CalendarTabBar extends StatelessWidget {
  CalendarTabBar({Key? key}) : super(key: key);
  final SubmitCouncilScreenController _SubmitCouncilScreenController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: createTabbar(),
    );
  }

  Widget createTabbar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      verticalDirection: VerticalDirection.up,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: SizeUtils.verticalBlockSize * 5.2,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(
                width: 1.5,
                color: AppColors.darkBlue,
              ),
            ),
          ),
          child: TabBar(
            labelStyle: TextStyle(
              fontSize: SizeUtils.fSize_14(),
              fontWeight: FontWeight.w600,
            ),
            controller: _SubmitCouncilScreenController.tabController,
            indicator: BoxDecoration(
              color: AppColors.darkBlue,
            ),
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.darkBlue,
            tabs: [
              Tab(
                text: StringsUtils.Home,
              ),
              Tab(
                text: StringsUtils.ContactUs,
              ),
            ],
          ),
        ),
        // tab bar view here
        Expanded(
          child: TabBarView(
            controller: _SubmitCouncilScreenController.tabController,
            children: [
              CalendarScreen(),
              ContactUsScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
