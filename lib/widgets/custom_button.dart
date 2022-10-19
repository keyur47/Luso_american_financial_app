import 'package:flutter/material.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';


Widget createButton({
  required String? text,
  required VoidCallback onTap,
  Color? buttonColor,
  Color? textColor,
  double? radius,
  double? vertical,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(
              radius ?? SizeUtils.horizontalBlockSize * 4.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: vertical ?? SizeUtils.verticalBlockSize * 1.6,
          ),
          child: Text(
            "$text",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: AssetsPath.roboto,
              fontSize: SizeUtils.fSize_14(),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget customAppLogo({double? vertical, double? height}) {
  return Padding(
    padding: EdgeInsets.only(
        top: vertical ?? SizeUtils.horizontalBlockSize * 19,
        bottom: SizeUtils.horizontalBlockSize * 10),
    child: Image.asset(
      AssetsPath.appLogo,
      height: height ?? SizeUtils.horizontalBlockSize * 23,
      width: double.infinity,
      // color: AppColors.backGroundColor,
    ),
  );
}
