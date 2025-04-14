import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/pref_constant.dart';

class OnBoardingPageController with ChangeNotifier {
  OnBoardingPageController() {
    unawaited(init());
  }

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeLoginData() async {
    try {
      await prefs.setBool(PrefConstant.isUserLogin, true);
    } catch (e) {
      BotToast.showNotification(
        title: (cancelFunc) {
          return Text(e.toString());
        },
      );
    }
  }
}
