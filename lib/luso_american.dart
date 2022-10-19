import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';
import 'package:luso_american_financial/utils/utils.dart';
import 'package:luso_american_financial/widgets/my_behavior.dart';
import 'utils/strings_utils.dart';
import 'widgets/app_binding.dart';

class LusoAmerican extends StatelessWidget {
  const LusoAmerican({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: StringsUtils.appName,
      initialBinding: AppBinding(),
      theme: ThemeData(
        brightness: Brightness.light,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        disabledColor: Colors.transparent,
        fontFamily: AssetsPath.roboto,
        backgroundColor: AppColors.white,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap:(){
              Utils.hideKeyboard(context);
            },
            child: ScrollConfiguration(behavior: MyBehavior(), child: child!),
          ),
        );
      },
    );
  }
}
