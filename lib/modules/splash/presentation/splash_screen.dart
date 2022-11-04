import 'package:flutter/material.dart';
import 'package:luso_american_financial/RemoteMessage/firebase_notification.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    FireBaseNotification().firebaseCloudMessagingLSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AssetsPath.splashScreen,
            fit: BoxFit.cover,
            height: SizeUtils.verticalBlockSize * 100,
            width: SizeUtils.horizontalBlockSize * 100,
          ),
          Positioned(
              bottom: SizeUtils.horizontalBlockSize * 10,
              child: AppText(
                text: StringsUtils.splashScreenText,
                color: AppColors.white,
                fontSize: SizeUtils.fSize_17(),
                letterSpacing: 1.6,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customAppLogo(height: SizeUtils.horizontalBlockSize * 40),
            ],
          )
        ],
      ),
    );
  }
}
