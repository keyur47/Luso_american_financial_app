import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/modules/dashbord/controller/dashbord_screen_controller.dart';
import 'package:luso_american_financial/modules/findagent/controller/find_agent_screen_controller.dart';
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

class FindAgentScreen extends StatefulWidget {
  FindAgentScreen({Key? key}) : super(key: key);

  @override
  State<FindAgentScreen> createState() => _FindAgentScreenState();
}

class _FindAgentScreenState extends State<FindAgentScreen> {
  final FindAgentScreenController findAgentScreenController = Get.find();
  final DashBordScreenController dashBordScreenController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    findAgentScreenController.FindAgentController.clear();
    findAgentScreenController.findAgent();
    super.initState();
  }

  void onChanged(String query) {
    //search
    print('findAgentScreenController.FindAgentController.text--->${findAgentScreenController.FindAgentController.text}');
    // findAgentScreenController.FindAgentController
    //     .clear();
    findAgentScreenController.searchData.clear();
    findAgentScreenController.formatDropDownValue.value = "";
    findAgentScreenController.searchData.value = findAgentScreenController.findAgentsModel.value.output?.where((e) {
          return (e.zip ?? '').contains(findAgentScreenController.FindAgentController.text);
        }).toList() ??
        [];
    setState(() {});
    print('object---->${findAgentScreenController.findAgentsModel.value.output?.length}');
    print('object---->${findAgentScreenController.searchData.value.length}');
    print('object---->${(findAgentScreenController.searchData.value)}');
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
                padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 8),
                child: Column(
                  children: [
                    AppText(
                      text: "Find an Agent",
                      color: AppColors.darkBlue,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w800,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 10),
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
                                    horizontal: SizeUtils.horizontalBlockSize * 13, vertical: SizeUtils.horizontalBlockSize * 0.5),
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
                                inputFormatters: [
                                  FilteringTextInputFormatter(
                                    RegExp(r'[0-9]'),
                                    allow: true,
                                  )
                                ],
                                cursorColor: Colors.transparent,
                                controller: findAgentScreenController.FindAgentController,
                                fillColor: AppColors.white,
                                onChanged: (value) {
                                  value = findAgentScreenController.FindAgentController.text;
                                  print(
                                      'findAgentScreenController.FindAgentController.text--->onchange--->${findAgentScreenController.FindAgentController.text}');
                                  // findAgentScreenController.FindAgentController
                                  //     .clear();
                                  findAgentScreenController.searchData.clear();
                                  findAgentScreenController.formatDropDownValue.value = "";
                                  findAgentScreenController.searchData.value = findAgentScreenController.findAgentsModel.value.output?.where((e) {
                                        return (e.zip ?? '').contains(findAgentScreenController.FindAgentController.text);
                                      }).toList() ??
                                      [];
                                  setState(() {});
                                  print('object---->${findAgentScreenController.findAgentsModel.value.output?.length}');
                                  print('object---->${findAgentScreenController.searchData.value.length}');
                                  print('object---->${(findAgentScreenController.searchData.value)}');
                                },
                                onFieldSubmitted: (value) {
                                  print(
                                      'findAgentScreenController.FindAgentController.text--->onTextFieldSubmit-->${findAgentScreenController.FindAgentController.text}');
                                  // findAgentScreenController.FindAgentController
                                  //     .clear();
                                  findAgentScreenController.searchData.clear();
                                  findAgentScreenController.formatDropDownValue.value = "";
                                  findAgentScreenController.searchData.value = findAgentScreenController.findAgentsModel.value.output?.where((e) {
                                        return (e.zip ?? '').contains(findAgentScreenController.FindAgentController.text);
                                      }).toList() ??
                                      [];
                                  setState(() {});
                                  print('object---->${findAgentScreenController.findAgentsModel.value.output?.length}');
                                  print('object---->${findAgentScreenController.searchData.value.length}');
                                  print('object---->${(findAgentScreenController.searchData.value)}');
                                },
                                keyboardType: TextInputType.phone,
                                hintText: StringsUtils.zipCode,
                                hintTextColor: AppColors.grey,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: SizeUtils.horizontalBlockSize * 3.3,
                                  horizontal: SizeUtils.horizontalBlockSize * 4,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 2, horizontal: SizeUtils.horizontalBlockSize * 7),
                                child: AppText(text: "WITHIN"),
                              ),
                              dropDown(
                                text: "10 Miles",
                                color: AppColors.darkBlue.withOpacity(0.3),
                                onChanged: (val) async {
                                  findAgentScreenController.formatDropDownValue.value = val.toString();
                                  print(" _authenticationController.formatDropDownValue.value${findAgentScreenController.formatDropDownValue.value}");
                                },
                                dropDownList: findAgentScreenController.format,
                                dropDownValue: findAgentScreenController.formatDropDownValue,
                              ),
                            ],
                          ),
                          createButton(
                            radius: SizeUtils.horizontalBlockSize * 2,
                            text: 'SUBMIT',
                            onTap: () {
                              print(
                                  'findAgentScreenController.FindAgentController.text--->onButtonSubmit--->${findAgentScreenController.FindAgentController.text}');
                              // findAgentScreenController.FindAgentController
                              //     .clear();
                              findAgentScreenController.searchData.clear();
                              findAgentScreenController.formatDropDownValue.value = "";
                              findAgentScreenController.searchData.value = findAgentScreenController.findAgentsModel.value.output?.where((e) {
                                    return (e.zip ?? '').contains(findAgentScreenController.FindAgentController.text);
                                  }).toList() ??
                                  [];
                              setState(() {});
                              print('object---->${findAgentScreenController.findAgentsModel.value.output?.length}');
                              print('object---->${findAgentScreenController.searchData.value.length}');
                              print('object---->${(findAgentScreenController.searchData.value)}');
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
                      padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 3),
                      child: AppText(
                        text: "Adults",
                        fontWeight: FontWeight.w700,
                        fontSize: SizeUtils.fSize_16(),
                        color: AppColors.darkBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 4),
                      child: Obx(
                        () => findAgentScreenController.isLoading.value
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
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(
                                      height: 10,
                                      color: Colors.transparent,
                                      thickness: 1,
                                    );
                                  },
                                ),
                              )
                            : findAgentScreenController.FindAgentController.text.isNotEmpty && findAgentScreenController.searchData.isEmpty
                                ? Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
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
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: findAgentScreenController.FindAgentController.text.isNotEmpty
                                        ? findAgentScreenController.searchData.length
                                        : findAgentScreenController.findAgentsModel.value.output?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return liveBox(
                                        address: findAgentScreenController.FindAgentController.text.isNotEmpty
                                            ? findAgentScreenController.searchData[index].address
                                            : findAgentScreenController.findAgentsModel.value.output?[index].address,
                                        name: findAgentScreenController.FindAgentController.text.isNotEmpty
                                            ? findAgentScreenController.searchData[index].name
                                            : findAgentScreenController.findAgentsModel.value.output?[index].name,
                                        phone: findAgentScreenController.FindAgentController.text.isNotEmpty
                                            ? findAgentScreenController.searchData[index].phone
                                            : findAgentScreenController.findAgentsModel.value.output?[index].phone,
                                        onTap: () async {
                                          print('email--->${findAgentScreenController.searchData[index].email}');
                                          var url = findAgentScreenController.FindAgentController.text.isNotEmpty &&
                                                  findAgentScreenController.searchData.isNotEmpty
                                              ? "mailto:${findAgentScreenController.searchData[index].email}"
                                              : "mailto:${findAgentScreenController.findAgentsModel.value.output?[index].email}";
                                          await launch(url);
                                        },
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
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
                              controller: findAgentScreenController.pageController,
                              onPageChanged: (int index) {
                                findAgentScreenController.currentPage.value = index;
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
                          padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 27, horizontal: SizeUtils.horizontalBlockSize * 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (findAgentScreenController.currentPage.value != 0) {
                                    findAgentScreenController.currentPage.value--;
                                    findAgentScreenController.pageController.jumpToPage(findAgentScreenController.currentPage.value);
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
                                  if (findAgentScreenController.currentPage.value !=
                                      int.parse(dashBordScreenController.bannerMediaModal.value.testData?.length.toString() ?? "0") - 1) {
                                    findAgentScreenController.currentPage.value++;
                                    findAgentScreenController.pageController.jumpToPage(findAgentScreenController.currentPage.value);
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
                      height: SizeUtils.horizontalBlockSize * 7,
                    ),
                    Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < int.parse(dashBordScreenController.bannerMediaModal.value.testData?.length.toString() ?? "0"); i++)
                            if (i == findAgentScreenController.currentPage.value) const SlideDotsIeam(true) else const SlideDotsIeam(false)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 11,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     right: SizeUtils.horizontalBlockSize * 6,
                    //     bottom: SizeUtils.horizontalBlockSize * 3,
                    //   ),
                    //   child: const Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: CircleAvatar(
                    //       backgroundColor: AppColors.darkBlue,
                    //       radius: 20,
                    //       child: Icon(
                    //         Icons.keyboard_arrow_up_rounded,
                    //         color: AppColors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget liveBox({String? name, String? address, String? phone, GestureTapCallback? onTap}) {
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
              width: SizeUtils.horizontalBlockSize * 32,
              child: AppText(
                text: "$name",
                fontWeight: FontWeight.w700,
                maxLines: 1,
                color: AppColors.black,
                fontSize: SizeUtils.fSize_13(),
              ),
            ),
            SizedBox(width: SizeUtils.horizontalBlockSize * 3),
            Expanded(
              child: SizedBox(
                width: SizeUtils.horizontalBlockSize * 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "$phone",
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue,
                      fontSize: SizeUtils.fSize_12(),
                    ),
                    AppText(
                      text: "$address",
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue,
                      fontSize: SizeUtils.fSize_12(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.darkBlue, borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 1, horizontal: SizeUtils.horizontalBlockSize * 4),
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
