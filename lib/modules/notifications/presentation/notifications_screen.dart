import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:luso_american_financial/modules/notifications/controller/notifications_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final NotificationsScreenController notificationsScreenController =
      Get.find();

  @override
  void initState() {
    // TODO: implement initState
    notificationsScreenController.notification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   onPressed: () {},
      //   child: CircleAvatar(backgroundColor: AppColors.darkBlue, radius: 20, child: Image.asset(AssetsPath.flotingIcon)),
      // ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 22),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.horizontalBlockSize * 10),
                  child: CustomTextField(
                    focusedColor: Colors.transparent,
                    enableColor: Colors.transparent,
                    disabledColor: Colors.transparent,
                    isPrefixIcon: true,
                    cursorColor: Colors.transparent,
                    controller: notificationsScreenController
                        .searchNotificationController,
                    fillColor: AppColors.white,
                    hintText: StringsUtils.search,
                    onChanged: (value) {
                      value = notificationsScreenController
                          .searchNotificationController.text;
                      print(
                          'notificationsScreenController.FindAgentController.text--->onchange--->${notificationsScreenController.searchNotificationController.text}');
                      // findAgentScreenController.FindAgentController
                      //     .clear();
                      notificationsScreenController.SearchResult.clear();
                      // findAgentScreenController.formatDropDownValue.value = "";
                      notificationsScreenController.SearchResult.value =
                          notificationsScreenController.notificationModal
                              .where((e) {
                        return (e.content?.rendered ?? '').contains(
                            notificationsScreenController
                                .searchNotificationController.text);
                      }).toList();
                      setState(() {});
                      print(
                          'object--onChange-->main list--->${notificationsScreenController.notificationModal.length}');
                      print(
                          'object--onChange-->search list--->${notificationsScreenController.SearchResult.length}');
                    },
                    onFieldSubmitted: (value) {
                      print(
                          'findAgentScreenController.FindAgentController.text--->onTextFieldSubmit--->${notificationsScreenController.searchNotificationController.text}');
                      // findAgentScreenController.FindAgentController
                      //     .clear();
                      notificationsScreenController.SearchResult.clear();
                      // findAgentScreenController.formatDropDownValue.value = "";
                      notificationsScreenController.SearchResult.value =
                          notificationsScreenController.notificationModal
                              .where((e) {
                        return (e.content?.rendered ?? '').contains(
                            notificationsScreenController
                                .searchNotificationController.text);
                      }).toList();
                      setState(() {});
                      print(
                          'object--onTextFieldSubmit-->main list--->${notificationsScreenController.notificationModal.length}');
                      print(
                          'object--onTextFieldSubmit-->search list--->${notificationsScreenController.SearchResult.length}');
                    },
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(SizeUtils.horizontalBlockSize * 10),
                      topRight:
                          Radius.circular(SizeUtils.horizontalBlockSize * 10),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 8),
                    child: Column(
                      children: [
                        AppText(
                          text: "Notifications",
                          color: AppColors.darkBlue,
                          fontSize: SizeUtils.fSize_15(),
                          fontWeight: FontWeight.w800,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: SizeUtils.horizontalBlockSize * 2.5,
                                  bottom: SizeUtils.horizontalBlockSize * 4.5,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeUtils.horizontalBlockSize * 12,
                                        vertical:
                                            SizeUtils.horizontalBlockSize *
                                                0.5),
                                    child: const AppText(
                                      text: "",
                                      fontSize: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeUtils.horizontalBlockSize * 2,
                        ),
                        Obx(
                          () => notificationsScreenController.isLoading.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.3),
                                  highlightColor: Colors.grey.withOpacity(0.1),
                                  child: ListView.separated(
                                    itemCount: 30,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return isLoadingNotificationsBox();
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeUtils.horizontalBlockSize *
                                                    7,
                                            vertical:
                                                SizeUtils.horizontalBlockSize *
                                                    3),
                                        child: const Divider(
                                          height: 10,
                                          color: AppColors.backGroundColor,
                                          thickness: 1,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : notificationsScreenController
                                          .searchNotificationController
                                          .text
                                          .isNotEmpty &&
                                      notificationsScreenController
                                          .SearchResult.isEmpty
                                  ? Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              50,
                                              0,
                                              30,
                                            ),
                                            child: Text(
                                              'No result found',
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : ListView.separated(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: notificationsScreenController
                                              .searchNotificationController
                                              .text
                                              .isNotEmpty
                                          ? notificationsScreenController
                                              .SearchResult.length
                                          : notificationsScreenController
                                                  .notificationModal.length +
                                              1,
                                      // itemCount: notificationsScreenController.notificationModal.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            notificationsScreenController
                                                .notificationModal.length) {
                                          return liveNotificationsBox(
                                              image: AssetsPath.contactUs,
                                              title: "New Event ",
                                              text:
                                                  "Festival de cultural Portugrend 2002nFestival de cultural Portugrend 2002n  ");
                                        }
                                        return liveNotificationsBox(
                                            title: "New Event ",
                                            // phone: findCouncilScreenController
                                            //     .FindAgentController
                                            //     .text
                                            //     .isNotEmpty
                                            //     ? findCouncilScreenController
                                            //     .SearchResult[index]
                                            //     .councilItemcode
                                            //     : findCouncilScreenController
                                            //     .findCouncilModel
                                            //     .value[index]
                                            //     .councilItemcode,
                                            text: notificationsScreenController
                                                    .searchNotificationController
                                                    .text
                                                    .isNotEmpty
                                                ? notificationsScreenController
                                                    .SearchResult[index]
                                                    .content
                                                    ?.rendered
                                                : "${notificationsScreenController.notificationModal.value[index].content?.rendered}");
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeUtils
                                                      .horizontalBlockSize *
                                                  7,
                                              vertical: SizeUtils
                                                      .horizontalBlockSize *
                                                  3),
                                          child: const Divider(
                                            height: 10,
                                            color: AppColors.backGroundColor,
                                            thickness: 1,
                                          ),
                                        );
                                      },
                                    ),
                        ),
                        SizedBox(
                          height: SizeUtils.horizontalBlockSize * 4,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget liveNotificationsBox({String? title, String? text, String? image}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image ?? AssetsPath.calendar,
            width: SizeUtils.horizontalBlockSize * 13,
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "$title",
                fontSize: SizeUtils.fSize_12(),
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 60,
                child: AppText(
                  text: parse(text).documentElement!.text,
                  maxLines: 3,
                  fontSize: SizeUtils.fSize_11(),
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget isLoadingNotificationsBox() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              AssetsPath.calendar,
              color: Colors.transparent,
              width: SizeUtils.horizontalBlockSize * 12,
            ),
          ),
          SizedBox(
            width: SizeUtils.horizontalBlockSize * 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: AppText(
                  text: "FindCouFisLoadingNoti",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  fontSize: SizeUtils.fSize_6(),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 2.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: AppText(
                  text:
                      "FindCouFisLoadingNotificationsBoxFindCouFisnsBoxFindCouFisFisnsBoxFindCouFis",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  fontSize: SizeUtils.fSize_6(),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 1.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: AppText(
                  text:
                      "FindCouFisLoadingNotificationsBoxFindCouFissBoxFindCouFisFisnsBoxFindCs",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  fontSize: SizeUtils.fSize_6(),
                ),
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 1.5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: AppText(
                  text:
                      "FindCouFisLoadingNotificationsBoxFindCouFissBoxFindCouFis",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent,
                  fontSize: SizeUtils.fSize_6(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
