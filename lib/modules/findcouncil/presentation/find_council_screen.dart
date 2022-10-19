import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/modules/dashbord/controller/dashbord_screen_controller.dart';
import 'package:luso_american_financial/modules/findcouncil/controller/find_council_screen_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';
import 'package:luso_american_financial/widgets/custom_dropdown_button.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';
import 'package:luso_american_financial/widgets/slide_dots.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class FindCouncilScreen extends StatefulWidget {
  FindCouncilScreen({Key? key}) : super(key: key);

  @override
  State<FindCouncilScreen> createState() => _FindCouncilScreenState();
}

class _FindCouncilScreenState extends State<FindCouncilScreen> {
  final FindCouncilScreenController findCouncilScreenController = Get.find();

  final DashBordScreenController dashBordScreenController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    findCouncilScreenController.findAgent();
    super.initState();
  }

  final scrollController = ScrollController();
  scrollToTop() {
    Timer(
      const Duration(seconds: 0),
          () => scrollController.animateTo(0.0,
          curve: Curves.easeOut, duration: const Duration(milliseconds: 100)),
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
      body: SingleChildScrollView(
        controller: scrollController,

        child: Column(
          children: [
            customAppLogo(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                  topRight: Radius.circular(SizeUtils.horizontalBlockSize * 10),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 8),
                child: Column(
                  children: [
                    AppText(
                      text: "Find an Council",
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
                                        SizeUtils.horizontalBlockSize * 13,
                                    vertical:
                                        SizeUtils.horizontalBlockSize * 0.5),
                                child: const AppText(
                                  text: "",
                                  fontSize: 0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                enableColor:
                                    AppColors.darkBlue.withOpacity(0.3),
                                cursorColor: Colors.transparent,
                                controller: findCouncilScreenController
                                    .FindAgentController,
                                fillColor: AppColors.white,
                                hintText: StringsUtils.zipCode,
                                keyboardType: TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.characters,
                                // inputFormatters: [
                                //   FilteringTextInputFormatter(RegExp(r'[0-9]'),
                                //       allow: true)
                                // ],
                                onChanged: (value) {
                                  value = findCouncilScreenController
                                      .FindAgentController.text;
                                  print(
                                      'findAgentScreenController.FindAgentController.text--->onchange--->${findCouncilScreenController.FindAgentController.text}');
                                  // findAgentScreenController.FindAgentController
                                  //     .clear();
                                  findCouncilScreenController.SearchResult
                                      .clear();
                                  // findAgentScreenController.formatDropDownValue.value = "";
                                  findCouncilScreenController
                                          .SearchResult.value =
                                      findCouncilScreenController
                                          .findCouncilModel
                                          .where((e) {
                                    return (e.councilItemcode ?? '').contains(
                                        findCouncilScreenController
                                            .FindAgentController.text);
                                  }).toList();
                                  setState(() {});
                                  print(
                                      'object--onChange-->main list--->${findCouncilScreenController.findCouncilModel.length}');
                                  print(
                                      'object--onChange-->search list--->${findCouncilScreenController.SearchResult.length}');
                                },
                                onFieldSubmitted: (value) {
                                  print(
                                      'findAgentScreenController.FindAgentController.text--->onTextFieldSubmit--->${findCouncilScreenController.FindAgentController.text}');
                                  // findAgentScreenController.FindAgentController
                                  //     .clear();
                                  findCouncilScreenController.SearchResult
                                      .clear();
                                  // findAgentScreenController.formatDropDownValue.value = "";
                                  findCouncilScreenController
                                          .SearchResult.value =
                                      findCouncilScreenController
                                          .findCouncilModel
                                          .where((e) {
                                    return (e.councilItemcode ?? '').contains(
                                        findCouncilScreenController
                                            .FindAgentController.text);
                                  }).toList();
                                  setState(() {});
                                  print(
                                      'object--onTextFieldSubmit-->main list--->${findCouncilScreenController.findCouncilModel.length}');
                                  print(
                                      'object--onTextFieldSubmit-->search list--->${findCouncilScreenController.SearchResult.length}');
                                },
                                hintTextColor: AppColors.grey,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical:
                                        SizeUtils.horizontalBlockSize * 3.3,
                                    horizontal:
                                        SizeUtils.horizontalBlockSize * 4),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeUtils.horizontalBlockSize * 2,
                                    horizontal:
                                        SizeUtils.horizontalBlockSize * 7),
                                child: AppText(text: "WITHIN"),
                              ),
                              dropDown(
                                text: "10 Miles",
                                color: AppColors.darkBlue.withOpacity(0.3),
                                onChanged: (val) async {
                                  findCouncilScreenController
                                      .formatDropDownValue
                                      .value = val.toString();
                                  print(
                                      " _authenticationController.formatDropDownValue.value${findCouncilScreenController.formatDropDownValue.value}");
                                },
                                dropDownList:
                                    findCouncilScreenController.format,
                                dropDownValue: findCouncilScreenController
                                    .formatDropDownValue,
                              ),
                            ],
                          ),
                          createButton(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            text: 'SUBMIT',
                            onTap: () {
                              print(
                                  'findAgentScreenController.FindAgentController.text--->onButtonPress--->${findCouncilScreenController.FindAgentController.text}');
                              // findAgentScreenController.FindAgentController
                              //     .clear();
                              findCouncilScreenController.SearchResult.clear();
                              // findAgentScreenController.formatDropDownValue.value = "";
                              findCouncilScreenController.SearchResult.value =
                                  findCouncilScreenController.findCouncilModel
                                      .where((e) {
                                return (e.councilItemcode ?? '').contains(
                                    findCouncilScreenController
                                        .FindAgentController.text);
                              }).toList();
                              setState(() {});
                              print(
                                  'object--onButtonPress-->main list--->${findCouncilScreenController.findCouncilModel.length}');
                              print(
                                  'object--onButtonPress-->search list--->${findCouncilScreenController.SearchResult.length}');
                            },
                            buttonColor: AppColors.darkBlue,
                            textColor: AppColors.white,
                          ),
                          AppText(
                            text: StringsUtils.councilText,
                            textAlign: TextAlign.center,
                            fontSize: SizeUtils.fSize_13(),
                            color: AppColors.red,
                          ),
                          SizedBox(
                            height: SizeUtils.horizontalBlockSize * 6,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeUtils.horizontalBlockSize * 3),
                      child: AppText(
                        text: "Adults",
                        fontWeight: FontWeight.w700,
                        fontSize: SizeUtils.fSize_16(),
                        color: AppColors.darkBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 4),
                      child: Obx(
                        () => findCouncilScreenController.isLoading.value
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.3),
                                highlightColor: Colors.grey.withOpacity(0.1),
                                child: ListView.separated(
                                  itemCount: 30,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return loadingBox();
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                      thickness: 1,
                                    );
                                  },
                                ),
                              )
                            : findCouncilScreenController
                                        .FindAgentController.text.isNotEmpty &&
                                    findCouncilScreenController
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
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: findCouncilScreenController
                                            .FindAgentController.text.isNotEmpty
                                        ? findCouncilScreenController
                                            .SearchResult.length
                                        : findCouncilScreenController
                                            .findCouncilModel.length,
                                    itemBuilder: (context, index) {
                                      return liveBox(
                                        phone: findCouncilScreenController
                                                .FindAgentController
                                                .text
                                                .isNotEmpty
                                            ? findCouncilScreenController
                                                .SearchResult[index]
                                                .councilItemcode
                                            : findCouncilScreenController
                                                .findCouncilModel
                                                .value[index]
                                                .councilItemcode,
                                        name: findCouncilScreenController
                                                .FindAgentController
                                                .text
                                                .isNotEmpty
                                            ? findCouncilScreenController
                                                .SearchResult[index].displayName
                                            : findCouncilScreenController
                                                .findCouncilModel
                                                .value[index]
                                                .displayName,
                                        address: findCouncilScreenController
                                                .FindAgentController
                                                .text
                                                .isNotEmpty
                                            ? findCouncilScreenController
                                                .SearchResult[index]
                                                .councilAddress
                                            : findCouncilScreenController
                                                .findCouncilModel
                                                .value[index]
                                                .councilAddress,
                                        onTap: () async {
                                          var url = findCouncilScreenController
                                                  .FindAgentController
                                                  .text
                                                  .isNotEmpty
                                              ? "mailto:${findCouncilScreenController.SearchResult[index].userEmail}"
                                              : "mailto:${findCouncilScreenController.findCouncilModel.value[index].userEmail}";
                                          await launch(url);
                                        },
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const Divider(
                                        height: 10,
                                        color: Colors.transparent,
                                        thickness: 1,
                                      );
                                    },
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: SizeUtils.horizontalBlockSize * 60,
                          child: Obx(
                            () => PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller:
                                  findCouncilScreenController.pageController,
                              onPageChanged: (int index) {
                                findCouncilScreenController.currentPage.value =
                                    index;
                              },
                              itemCount: int.parse(dashBordScreenController
                                      .bannerMediaModal.value.testData?.length
                                      .toString() ??
                                  "0"),
                              itemBuilder: (ctx, index) {
                                print(
                                    " dashBordScreenController.bannerMediaModal.value.testData?[index]:-${dashBordScreenController.bannerMediaModal.value.testData?[index]}");
                                return dashBordScreenController.isLoading.value
                                    ? CircularProgressIndicator()
                                    : slideImage(index: index);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeUtils.horizontalBlockSize * 27,
                              horizontal: SizeUtils.horizontalBlockSize * 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (findCouncilScreenController
                                          .currentPage.value !=
                                      0) {
                                    findCouncilScreenController
                                        .currentPage.value--;
                                    findCouncilScreenController.pageController
                                        .jumpToPage(findCouncilScreenController
                                            .currentPage.value);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(10)),
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
                                  if (findCouncilScreenController
                                          .currentPage.value !=
                                      int.parse(dashBordScreenController
                                                  .bannerMediaModal
                                                  .value
                                                  .testData
                                                  ?.length
                                                  .toString() ??
                                              "0") -
                                          1) {
                                    findCouncilScreenController
                                        .currentPage.value++;
                                    findCouncilScreenController.pageController
                                        .jumpToPage(findCouncilScreenController
                                            .currentPage.value);
                                  } else {}
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(10)),
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
                      height: SizeUtils.horizontalBlockSize * 7,
                    ),
                    Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0;
                              i <
                                  int.parse(dashBordScreenController
                                          .bannerMediaModal
                                          .value
                                          .testData
                                          ?.length
                                          .toString() ??
                                      "0");
                              i++)
                            if (i ==
                                findCouncilScreenController.currentPage.value)
                              const SlideDotsIeam(true)
                            else
                              const SlideDotsIeam(false)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 11,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget liveBox({
    String? name,
    String? address,
    String? phone,
    GestureTapCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 2,
          color: AppColors.darkBlue,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2,
          vertical: SizeUtils.horizontalBlockSize * 1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 30,
              child: AppText(
                text: "$name",
                fontWeight: FontWeight.w700,
                maxLines: 1,
                color: AppColors.black,
                fontSize: SizeUtils.fSize_13(),
              ),
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 15,
              child: AppText(
                text: "$address",
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlue,
                maxLines: 2,
                fontSize: SizeUtils.fSize_12(),
              ),
            ),
            SizedBox(width: SizeUtils.horizontalBlockSize * 2),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 6,
              child: AppText(
                text: "$phone",
                fontWeight: FontWeight.w700,
                color: AppColors.darkBlue,
                maxLines: 1,
                fontSize: SizeUtils.fSize_12(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeUtils.horizontalBlockSize * 1,
                      horizontal: SizeUtils.horizontalBlockSize * 4),
                  child: AppText(
                    text: "Email",
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    fontSize: SizeUtils.fSize_12(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 2, color: AppColors.darkBlue),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2,
          vertical: SizeUtils.horizontalBlockSize * 1.9,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: AppText(
                text: "FindCouFindjj",
                fontWeight: FontWeight.w500,
                color: Colors.transparent,
                fontSize: SizeUtils.fSize_12(),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AppText(
                      text: "FindCouFindfghCou",
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent,
                      fontSize: SizeUtils.fSize_8(),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: AppText(
                      text: "FindCouFindfghCou",
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent,
                      fontSize: SizeUtils.fSize_8(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: AppText(
                text: "FindCouF",
                fontWeight: FontWeight.w500,
                color: Colors.transparent,
                fontSize: SizeUtils.fSize_8(),
              ),
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 3,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeUtils.horizontalBlockSize * 1,
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                ),
                child: AppText(
                  text: "zipcode",
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  fontSize: SizeUtils.fSize_12(),
                ),
              ),
            ),
          ],
        ),
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
                imageUrl: dashBordScreenController
                        .bannerMediaModal.value.testData?[index] ??
                    "",
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
                errorWidget: (context, url, error) =>
                    Text("Something went wrong!"),
              ),
      ],
    );
  }
}
