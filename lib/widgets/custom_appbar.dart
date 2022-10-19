import 'package:flutter/material.dart';
import 'package:luso_american_financial/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.backGroundColor,
    this.title,
    this.leading,
    this.leadingIconColor,
    this.action,
    this.centerTitle,
    this.elevation,
    this.leadingWidth,
    this.shadowColor,
    this.bottom,
    this.toolbarHeight,
    this.appBarSize,
    this.automaticallyImplyLeading,
  }) : super(key: key);

  final Color? backGroundColor;
  final Color? shadowColor;
  final Color? leadingIconColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? action;
  final double? elevation;
  final double? leadingWidth;
  final double? appBarSize;
  final bool? centerTitle;
  final double? toolbarHeight;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? AppColors.backGroundColor,
      title: title,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      // leading: (automaticallyImplyLeading ?? true) && leading == null
      //     ? IconButton(
      //   onPressed: () {
      //     Navigation.pop();
      //   },
      //   icon: Icon(
      //     Icons.arrow_back_ios_rounded,
      //     color: leadingIconColor ?? AppColors.black[200],
      //     size: 23,
      //   ),
      // )
      //     : leading,
      actions: action,
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? false,
      shadowColor: shadowColor ?? AppColors.white[30],
      leadingWidth: leadingWidth,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarSize ?? 170);
}