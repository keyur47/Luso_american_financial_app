import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luso_american_financial/modules/login/controller/login_controller.dart';
import 'package:luso_american_financial/modules/login/google/presentation/google_login.dart';
import 'package:luso_american_financial/modules/login/mobile/controller/mobile_login_controller.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/assets_path.dart';
import 'package:luso_american_financial/utils/size_utils.dart';
import 'package:luso_american_financial/utils/strings_utils.dart';
import 'package:luso_american_financial/widgets/app_text.dart';
import 'package:luso_american_financial/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();
  final MobileLoginController mobileLoginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    height: SizeUtils.horizontalBlockSize * 55,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeUtils.horizontalBlockSize * 23,
                    right: SizeUtils.horizontalBlockSize * 9,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      AssetsPath.appLogo,
                      height: SizeUtils.horizontalBlockSize * 26,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 10,
                vertical: SizeUtils.horizontalBlockSize * 10,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Mobile Number",
                    controller: loginController.nameController,
                  ),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 8,
                  ),
                  CustomTextField(
                    hintText: "UserName",
                    controller: mobileLoginController.contactNumber,
                  ),
                ],
              ),
            ),
            _loginButton,
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: AppColors.black,
                  width: SizeUtils.horizontalBlockSize * 35,
                  height: SizeUtils.horizontalBlockSize * 0.2,
                ),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                AppText(text: "OR"),
                SizedBox(
                  width: SizeUtils.horizontalBlockSize * 2,
                ),
                Container(
                  color: AppColors.black,
                  width: SizeUtils.horizontalBlockSize * 35,
                  height: SizeUtils.horizontalBlockSize * 0.2,
                )
              ],
            ),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 6.5,
            ),
            _googleLoginButton,
          ],
        ),
      ),
    );
  }

  Widget get _googleLoginButton => Padding(
        padding: EdgeInsets.fromLTRB(
          SizeUtils.horizontalBlockSize * 8,
          SizeUtils.horizontalBlockSize * 0,
          SizeUtils.horizontalBlockSize * 8,
          0,
        ),
        child: MaterialButton(
          height: 56,
          minWidth: double.infinity,
          color: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30)),
          onPressed: () async {
            FirebaseService service = FirebaseService();
            await service.signInWithGoogle();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icon/google.svg',
                height: SizeUtils.horizontalBlockSize * 7,
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 3,
              ),
              AppText(
                text: "Sing in with Google",
                color: AppColors.white,
                fontSize: SizeUtils.fSize_15(),
              )
            ],
          ),
        ),
      );

  Widget get _loginButton => Padding(
        padding: EdgeInsets.fromLTRB(
          SizeUtils.horizontalBlockSize * 8,
          SizeUtils.horizontalBlockSize * 0,
          SizeUtils.horizontalBlockSize * 8,
          0,
        ),
        child: MaterialButton(
          height: 56,
          minWidth: double.infinity,
          color: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30)),
          onPressed: () {
            mobileLoginController.mobileLogin(
                contact:
                "+91${mobileLoginController.contactNumber.text.trim()}");
          },
          child: Text(
            StringsUtils.login.toUpperCase(),
            style: TextStyle(
              fontSize: SizeUtils.fSize_14(),
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = AppColors.darkBlue;
    // create a path
    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.300,
        size.width * 0.5, size.height * 0.760);
    path.quadraticBezierTo(size.width * 0.75, size.height * 1.3, size.width * 1,
        size.height * 0.940);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
