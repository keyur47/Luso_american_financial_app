import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/helper/toast_helper.dart';
import 'package:luso_american_financial/modules/submitcouncilphoto/controller/submit_council_photo_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';

class SubmitCouncilScreen extends StatefulWidget {
  SubmitCouncilScreen({Key? key}) : super(key: key);

  @override
  State<SubmitCouncilScreen> createState() => _SubmitCouncilScreenState();
}

class _SubmitCouncilScreenState extends State<SubmitCouncilScreen> {
  final SubmitCouncilScreenController submitCouncilScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
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
              child: Form(
                key: submitCouncilScreenController.signUpFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 27,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 10),
                      child: CustomTextField(
                        focusedColor: Colors.transparent,
                        enableColor: Colors.transparent,
                        disabledColor: Colors.transparent,
                        isPrefixIcon: true,
                        cursorColor: Colors.transparent,
                        controller: submitCouncilScreenController.searchSubmitCouncilScreenController,
                        fillColor: AppColors.white,
                        hintText: StringsUtils.search,
                        hintTextColor: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 14,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                          topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 8),
                        child: Column(
                          children: [
                            AppText(
                              text: "Submit Council Photo",
                              color: AppColors.darkBlue,
                              fontSize: SizeUtils.fSize_15(),
                              fontWeight: FontWeight.w800,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 10),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeUtils.horizontalBlockSize * 3.6,
                                      bottom: SizeUtils.horizontalBlockSize * 4.5,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.darkBlue,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: SizeUtils.horizontalBlockSize * 12, vertical: SizeUtils.horizontalBlockSize * 0.5),
                                        child: const AppText(
                                          text: "",
                                          fontSize: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2),
                                        child: Obx(
                                          () => CustomTextField(
                                            showCursor: false,
                                            cursorColor: Colors.transparent,
                                            // validator:
                                            //     AppValidator.isPhotoSelectValid,
                                            readOnly: true,
                                            fillColor: AppColors.grey.withOpacity(0.1),
                                            hintText: submitCouncilScreenController.tAddTournamentLogo.value.isEmpty
                                                ? StringsUtils.council
                                                : submitCouncilScreenController.tAddTournamentLogo.value.split('/').last,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 7, bottom: SizeUtils.horizontalBlockSize * 2),
                                        child: AppText(
                                          text: "Upload Signed Document",
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeUtils.fSize_15(),
                                          color: AppColors.darkBlue,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          submitCouncilScreenController.fileTeamLogo();
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(color: AppColors.darkBlue, borderRadius: BorderRadius.circular(4)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: SizeUtils.horizontalBlockSize * 2, horizontal: SizeUtils.horizontalBlockSize * 3),
                                              child: AppText(
                                                text: "select file for upload ",
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeUtils.fSize_10(),
                                                color: AppColors.white,
                                              ),
                                            )),
                                      ),
                                      createButton(
                                        vertical: SizeUtils.horizontalBlockSize * 4,
                                        radius: SizeUtils.horizontalBlockSize * 2,
                                        text: 'SUBMIT',
                                        onTap: () {
                                          if (submitCouncilScreenController.tAddTournamentLogo.value.isNotEmpty) {
                                            // AppToast.toastMessage("success");
                                            submitCouncilScreenController.submitCouncilUpload(
                                              fileUpload: File(
                                                submitCouncilScreenController.tAddTournamentLogo.value.split('/').last,
                                              ),
                                            );
                                            submitCouncilScreenController.tAddTournamentLogo.value = "";
                                          } else {
                                            AppToast.toastMessage("Please photo select");
                                          }
                                        },
                                        buttonColor: AppColors.darkBlue,
                                        textColor: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: SizeUtils.horizontalBlockSize * 5,
                            //       horizontal: SizeUtils.horizontalBlockSize * 2),
                            //   child: ListView.separated(
                            //     padding: EdgeInsets.zero,
                            //     scrollDirection: Axis.vertical,
                            //     shrinkWrap: true,
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     itemCount: 4 + 1,
                            //     itemBuilder: (context, index) {
                            //       if (index == 4) {
                            //         return notificationsBox(
                            //             image: AssetsPath.contact,
                            //             title: "New Event ",
                            //             text:
                            //                 "Festival de cultural Portugrend 2002nFestival de cultural Portugrend 2002n  ");
                            //       }
                            //       return notificationsBox(
                            //           title: "New Event ",
                            //           text:
                            //               "Festival de cultural Portugrend 2002nFestival de cultural Portugrend 2002n  ");
                            //     },
                            //     separatorBuilder:
                            //         (BuildContext context, int index) {
                            //       return Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             horizontal:
                            //                 SizeUtils.horizontalBlockSize * 7,
                            //             vertical:
                            //                 SizeUtils.horizontalBlockSize * 3),
                            //         child: const Divider(
                            //           height: 10,
                            //           color: AppColors.backGroundColor,
                            //           thickness: 1,
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
