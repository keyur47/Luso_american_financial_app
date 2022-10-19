import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';
import 'package:luso_american_financial/model/slide_list_model.dart';
import 'package:luso_american_financial/modules/onboarding/controller/onboarding_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/navigation_utils/navigation.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';
import 'package:luso_american_financial/widgets/slide_dots.dart';



class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final OnboardingScreenController splashScreenController = Get.find();

  // @override
  // void initState() {
  //   super.initState();
  //   // Timer.periodic(const Duration(seconds: 5), (Timer timer) {
  //   //   if (splashScreenController.currentPage < 2) {
  //   //     splashScreenController.currentPage++;
  //   //   } else {
  //   //     splashScreenController.currentPage = 0;
  //   //   }
  //   //
  //   //   splashScreenController.pageController.animateToPage(
  //   //     splashScreenController.currentPage,
  //   //     duration: const Duration(milliseconds: 300),
  //   //     curve: Curves.easeIn,
  //   //   );
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: splashScreenController.pageController,
            onPageChanged: (int index) {
              splashScreenController.currentPage.value = index;
            },
            itemCount: slideList.length,
            itemBuilder: (ctx, index) => slideItem(index: index),
          ),
          customAppLogo(vertical: SizeUtils.horizontalBlockSize * 20,height: SizeUtils.horizontalBlockSize * 35),
          Positioned(
            top: SizeUtils.horizontalBlockSize * 110,
            child:  Column(
              children: [
                AppText(
                  text: slideList[splashScreenController.currentPage.value].title,
                  color: AppColors.white,
                  fontSize: SizeUtils.fSize_24(),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: SizeUtils.horizontalBlockSize * 35,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slideList.length; i++)
                      if (i == splashScreenController.currentPage.value)
                        const SlideDots(true)
                      else
                        const SlideDots(false)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 6),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: createButton(
                  onTap: () {
                    AppPreference.setInt(1);
                    AppPreference.getInt();
                    Navigation.popAndPushNamed(Routes.dashBordScreen);
                  },
                  text: StringsUtils.getStarted),
            ),
          ),
        ],
      ),
    );
  }

  Widget slideItem({required int index}) {
    return Stack(
      children: <Widget>[
        Image.asset(
          slideList[index].imageUrl,
          fit: BoxFit.cover,
          // color: Colors.green,
          height: SizeUtils.verticalBlockSize * 100,
          width: SizeUtils.horizontalBlockSize * 100,
        ),
      ],
    );
  }
}
