import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static late SharedPreferences _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setInt(int value) async {
    await _prefs.setInt("onbording", value);
  }

  static int? getInt() {
    final int? value = _prefs.getInt("onbording");
    return value;
  }

  static Future setLoginInt(int value) async {
    await _prefs.setInt("login", value);
  }

  static int? getLoginInt() {
    final int? value = _prefs.getInt("login");
    return value;
  }
}
