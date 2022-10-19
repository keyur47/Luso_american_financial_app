import 'package:flutter/material.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';


class SlideDots extends StatelessWidget {
  final bool isActive;
  const SlideDots(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin:  EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 1),
      height: isActive ?  SizeUtils.horizontalBlockSize * 1.5 : SizeUtils.horizontalBlockSize * 1.5,
      width: isActive ? SizeUtils.horizontalBlockSize * 4.5 :SizeUtils.horizontalBlockSize * 2.3,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}


class SlideDotsIeam extends StatelessWidget {
  final bool isActive;
  const SlideDotsIeam(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin:  EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 1.8),
      height: isActive ?  SizeUtils.horizontalBlockSize * 2.4 : SizeUtils.horizontalBlockSize * 2.4,
      width: isActive ? SizeUtils.horizontalBlockSize * 2.4:SizeUtils.horizontalBlockSize * 2.4,
      decoration: BoxDecoration(
        color: isActive ? AppColors.darkBlue: Colors.transparent,
        border:  isActive ?  Border.all(width: 2,color: AppColors.darkBlue) :Border.all(width: 1.4,color: AppColors.darkBlue),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}