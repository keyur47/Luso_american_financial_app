import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luso_american_financial/RemoteMessage/firebase_notification.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';
import 'package:luso_american_financial/luso_american.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.initMySharedPreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseNotification().setUpLocalNotification();
  runApp(LusoAmerican());
}
