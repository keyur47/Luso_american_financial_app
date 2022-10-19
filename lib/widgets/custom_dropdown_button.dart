import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';


Widget dropDown({
  required RxString dropDownValue,
  required RxList dropDownList,
  required ValueChanged onChanged,
  String type = "",
  String text = "",
  double? height,
  double? width,
  Color? color,
}) {
  return Container(
    height: height ?? SizeUtils.verticalBlockSize * 5.4,
    width: width ?? double.infinity,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)), color: AppColors.white, border: Border.all(color: color ?? AppColors.white[80]!)),
    child: Padding(
      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 4, right: SizeUtils.horizontalBlockSize * 4),
      child: Obx(
            () => DropdownButton(
            iconEnabledColor: AppColors.black,
            itemHeight: 50.0,
            icon: Padding(
              padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 0),
              child: Icon(Icons.keyboard_arrow_down_outlined),
            ),
            dropdownColor: AppColors.white,
            underline: Container(),
            hint: dropDownValue.isEmpty
                ? Padding(
              padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 0),
              child: AppText(
                text: text,
                fontSize: SizeUtils.fSize_14(),
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            )
                : Padding(
              padding: EdgeInsets.only(top: SizeUtils.verticalBlockSize * 0),
              child: AppText(
                text: dropDownValue.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontSize: SizeUtils.fSize_14(),
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            isExpanded: true,
            iconSize: 30.0,
            style: const TextStyle(fontSize: 11, color: AppColors.black),
            items: dropDownList.map(
                  (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: AppText(
                    text: val,
                    fontSize: SizeUtils.fSize_14(),
                    fontWeight: FontWeight.w400,
                    // color: AppColors.textColor[300],
                  ),
                );
              },
            ).toList(),
            onChanged: onChanged),
      ),
    ),
  );
}