import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/utils/app_colors.dart';

class AppSnackBar {
  static void showErrorSnackBar({required String message, required String title}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      borderRadius: 8,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      barBlur: 10,
      colorText: AppColors.white,
      isDismissible: false,backgroundColor: Colors.black.withOpacity(0.2),
    );
  }
}
