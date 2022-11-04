import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/RemoteMessage/firebase_notification.dart';
import 'package:luso_american_financial/modules/dashbord/controller/dashbord_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/navigation_utils/navigation.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';
import 'package:luso_american_financial/widgets/slide_dots.dart';

class DashBordScreen extends StatefulWidget {
  DashBordScreen({Key? key}) : super(key: key);

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  final DashBordScreenController dashBordScreenController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    FireBaseNotification().localNotificationRequestPermissions();
    FireBaseNotification().configureDidReceiveLocalNotificationSubject();
    FireBaseNotification().configureSelectNotificationSubject();
    super.initState();
  }

  final scrollController = ScrollController();

  scrollToTop() {
    Timer(
      const Duration(seconds: 0),
      () => scrollController.animateTo(0.0, curve: Curves.easeOut, duration: const Duration(milliseconds: 100)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          scrollToTop();
        },
        child: CircleAvatar(backgroundColor: AppColors.darkBlue, radius: 20, child: Image.asset(AssetsPath.flotingIcon)),
      ),
      body: Stack(
        children: [
          // Padding(
          //   padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 22),
          //   child: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       color: AppColors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
          //         topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
          //       ),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                customAppLogo(),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                      topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconTitleBox(
                              context: context,
                              title: StringsUtils.calendar,
                              image: AssetsPath.calendar,
                              onTap: () {
                                Navigation.pushNamed(Routes.calendarTabBar);
                              },
                            ),
                            iconTitleBox(
                              context: context,
                              title: StringsUtils.notifications,
                              image: AssetsPath.notifications,
                              onTap: () {
                                Navigation.pushNamed(
                                  Routes.notificationsTabBar,
                                );
                              },
                            ),
                            iconTitleBox(
                              context: context,
                              title: StringsUtils.submitCouncilPhotos,
                              image: AssetsPath.submit,
                              onTap: () {
                                Navigation.pushNamed(
                                  Routes.submitCouncilTabBar,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 4,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconTitleBox(
                              color: AppColors.darkBlue[200],
                              context: context,
                              scale: 9,
                              title: StringsUtils.findAnAgent,
                              image: AssetsPath.findAgent,
                              onTap: () {
                                Navigation.pushNamed(Routes.findAgentScreen);
                              },
                            ),
                            iconTitleBox(
                              color: AppColors.darkBlue[200],
                              scale: 4.6,
                              context: context,
                              title: StringsUtils.findAnCouncil,
                              image: AssetsPath.findCouncil,
                              onTap: () {
                                Navigation.pushNamed(Routes.findCouncilScreen);
                              },
                            ),
                            iconTitleBox(
                              context: context,
                              title: StringsUtils.contactUs,
                              image: AssetsPath.contactUs,
                              onTap: () {
                                Navigation.pushNamed(Routes.contactsTabBar);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 16,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: SizeUtils.horizontalBlockSize * 60,
                            child: Obx(
                              () => PageView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: dashBordScreenController.pageController,
                                onPageChanged: (int index) {
                                  dashBordScreenController.currentPage.value = index;
                                },
                                itemCount: int.parse(dashBordScreenController.bannerMediaModal.value.testData?.length.toString() ?? "0"),
                                itemBuilder: (ctx, index) {
                                  print(
                                      " dashBordScreenController.bannerMediaModal.value.testData?[index]:-${dashBordScreenController.bannerMediaModal.value.testData?[index]}");
                                  return dashBordScreenController.isLoading.value ? CircularProgressIndicator() : slideImage(index: index);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 27, horizontal: SizeUtils.horizontalBlockSize * 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (dashBordScreenController.currentPage.value != 0) {
                                      dashBordScreenController.currentPage.value--;
                                      dashBordScreenController.pageController.jumpToPage(dashBordScreenController.currentPage.value);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (dashBordScreenController.currentPage.value !=
                                        int.parse(dashBordScreenController.bannerMediaModal.value.testData?.length.toString() ?? "0") - 1) {
                                      dashBordScreenController.currentPage.value++;
                                      dashBordScreenController.pageController.jumpToPage(dashBordScreenController.currentPage.value);
                                    } else {}
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 3,
                      ),
                      Container(
                        color: AppColors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for (int i = 0;
                                      i < int.parse(dashBordScreenController.bannerMediaModal.value.testData?.length.toString() ?? "0");
                                      i++)
                                    if (i == dashBordScreenController.currentPage.value) const SlideDotsIeam(true) else const SlideDotsIeam(false)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeUtils.horizontalBlockSize * 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconTitleBox({
    String? image,
    double? scale,
    double? width,
    String? title,
    Color? color,
    context,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "$image",
            scale: scale,
            width: width,
            color: color,
          ),
          SizedBox(
            height: SizeUtils.horizontalBlockSize * 2,
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 22,
            child: AppText(
              text: "$title",
              color: AppColors.darkBlue.withOpacity(0.7),
              fontWeight: FontWeight.w300,
              fontSize: SizeUtils.fSize_13(),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget slideImage({required int index}) {
    return Stack(
      children: <Widget>[
        dashBordScreenController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.darkBlue,
                ),
              )
            : CachedNetworkImage(
                imageUrl: dashBordScreenController.bannerMediaModal.value.testData?[index] ?? "",
                placeholder: (context, url) => Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsPath.appLogo,
                        width: SizeUtils.horizontalBlockSize * 20,
                      ),
                      AppText(
                        text: "Loading",
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_13(),
                      )
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => Text("Something went wrong!"),
              ),
      ],
    );
  }
}
