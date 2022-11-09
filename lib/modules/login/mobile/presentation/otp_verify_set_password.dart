import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/helper/snackbar.dart';
import 'package:luso_american_financial/modules/login/mobile/controller/mobile_login_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';

class OtpVerify extends StatelessWidget {
  OtpVerify({Key? key}) : super(key: key);
  String verificationId = Get.arguments[0];
  String contact = Get.arguments[1];

  final MobileLoginController mobileLoginController = Get.find();

  @override
  Widget build(BuildContext context) {
    log("screen-----------$verificationId");
    log("screen-----------$contact");
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 7,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetsPath.appLogo,
                          width: SizeUtils.horizontalBlockSize * 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 40,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeUtils.horizontalBlockSize * 10,
                                        vertical:
                                            SizeUtils.horizontalBlockSize * 15,
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              StringsUtils.verifyOtp,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                SizeUtils.horizontalBlockSize *
                                                    4,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: SizeUtils
                                                      .horizontalBlockSize *
                                                  3,
                                              vertical: SizeUtils
                                                      .horizontalBlockSize *
                                                  4,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: SizeUtils
                                                            .horizontalBlockSize *
                                                        2,
                                                  ),
                                                  child: OtpTextField(
                                                    numberOfFields: 6,
                                                    borderColor:
                                                        AppColors.darkBlue,
                                                    //set to true to show as box or false to show as dash
                                                    showFieldAsBox: true,
                                                    //runs when a code is typed in
                                                    onCodeChanged:
                                                        (String code) {
                                                      log("code----------$code");
                                                      //handle validation or checks here
                                                    },
                                                    autoFocus: true,

                                                    //runs when every textfield is filled
                                                    onSubmit: (String
                                                        verificationCode) {
                                                      log("verificationCode-------$verificationCode");
                                                      mobileLoginController
                                                              .otp.value =
                                                          verificationCode;
                                                    }, // end onSubmit
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeUtils
                                                          .horizontalBlockSize *
                                                      3,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: SizeUtils
                                                              .horizontalBlockSize *
                                                          3),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(StringsUtils
                                                          .didntGetOtp),
                                                      Obx(
                                                        () => GestureDetector(
                                                          onTap:
                                                              mobileLoginController
                                                                      .isEnabled
                                                                      .value
                                                                  ? resendCode
                                                                  : null,
                                                          child:
                                                              mobileLoginController
                                                                      .isEnabled
                                                                      .value
                                                                  ? Text(
                                                                      StringsUtils
                                                                          .sendAgain,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13),
                                                                    )
                                                                  : Text(
                                                                      "${mobileLoginController.counter.value}",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13),
                                                                    ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeUtils
                                                          .horizontalBlockSize *
                                                      8,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: SizeUtils
                                                              .horizontalBlockSize *
                                                          3),
                                                  child: SizedBox(
                                                    height: SizeUtils
                                                            .horizontalBlockSize *
                                                        12,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        verifyOTP();
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(AppColors
                                                                    .darkBlue),
                                                        padding:
                                                            MaterialStateProperty
                                                                .all(
                                                          EdgeInsets.symmetric(
                                                              vertical: SizeUtils
                                                                      .horizontalBlockSize *
                                                                  2),
                                                        ),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                          StringsUtils.submit),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeUtils
                                                          .horizontalBlockSize *
                                                      5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: SizeUtils
                                                              .horizontalBlockSize *
                                                          2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          Get.offAllNamed(
                                                        Routes.loginScreen,
                                                      ),
                                                      child: Text(
                                                        StringsUtils
                                                            .backToLogin,
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .darkBlue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: SizeUtils
                                                          .horizontalBlockSize *
                                                      0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    mobileLoginController.verifyOtp.value
                        ? Container(
                            height: SizeUtils.horizontalBlockSize * 100,
                            color: Colors.grey.withOpacity(0.5),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        SizeUtils.horizontalBlockSize * 10,
                                    horizontal:
                                        SizeUtils.horizontalBlockSize * 20),
                                child: Image.asset(AssetsPath.appLogo),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyOTP() async {
    log("otp---${mobileLoginController.otp.value.trim()}");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: mobileLoginController.otp.value.trim());

    try {
      mobileLoginController.verifyOtp.value = true;
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Get.offNamed(Routes.dashBordScreen);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        getSnackBar("Incorrect OTP", "Please enter correct otp",
            Colors.red.shade500, 3);

        log('Wrong OTP.');
      } else {
        Get.offNamed(Routes.loginScreen);
        getSnackBar(
            "Some error accrues", "Please try again", Colors.red.shade500, 3);
        log("OtpVerify---->${e.code.toString()}");
      }
    } catch (e) {
      getSnackBar(
          "Some error accrues", "Please try again", Colors.red.shade500, 3);

      log("OtpVerify---->${e.toString()}");
    } finally {
      mobileLoginController.verifyOtp.value = false;
    }
  }

  void resendCode() {
    mobileLoginController.mobileLogin(contact: contact);
    getSnackBar("OTP Has Been Sent", "Please Check Your Inbox",
        Colors.green.shade600, 2);

    mobileLoginController.counter.value = 30;
    mobileLoginController.isEnabled.value = false;
  }
}
