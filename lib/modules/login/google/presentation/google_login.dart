import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';
import 'package:luso_american_financial/helper/snackbar.dart';
import 'package:luso_american_financial/utils/navigation_utils/routes.dart';


class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  RxBool gmailLoading = false.obs;

  Future<String?> signInWithGoogle() async {
    try {
      gmailLoading.value = true;
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          AppPreference.setLoginInt(1);
          AppPreference.getLoginInt();
          Get.offNamed(Routes.dashBordScreen);
        }
      });
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        getSnackBar("Your account has been disabled",
            "Try with different account", Colors.red.shade500, 3);
        log('Disable Account.');
      } else {
        getSnackBar(
            "Some error accrues", "Please try again", Colors.red.shade500, 3);

        log("GmailLogin--->${e.toString()}");
      }
    } catch (e) {
      getSnackBar(
          "Some error accrues", "Please try again", Colors.red.shade500, 3);

      log("gmailLogin---->${e.toString()}");
    } finally {
      gmailLoading.value = false;
    }
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    Get.offAllNamed(Routes.loginScreen);
    log("logout------- with google");
  }
}
