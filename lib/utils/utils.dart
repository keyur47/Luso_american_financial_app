import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static void dismissKeyboard(BuildContext context) => FocusScope.of(context).requestFocus(FocusNode());

  static void hideKeyboard(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void changeStatusBarColor({int? value}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: value == 2 ? Brightness.dark : Brightness.light,
      ),
    );
  }

  static dateFormat(DateTime date) {
    final DateFormat formatter = DateFormat('dd/M/yy');
    final String formatted = formatter.format(date);
    return formatted;
  }
}

typeCheck(json, key) {
  return json[key].runtimeType == int ? double.parse(json[key].toString()) : json[key];
}
