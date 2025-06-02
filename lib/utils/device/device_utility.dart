import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppDeviceUtils {
  AppDeviceUtils._();

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusbarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandingScapeOrientation(BuildContext context) {
    final viweInsets = View.of(context).viewInsets;
    return viweInsets.bottom != 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viweInsets = View.of(context).viewInsets;
    return viweInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getAppBarHeigth() {
    return kToolbarHeight;
  }

  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeigth(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNavigationBarHeiht() {
    return kBottomNavigationBarHeight;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static bool isDarkMode() {
    return MediaQuery.of(Get.context!).platformBrightness == Brightness.dark;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // static void lauchUrl(String url) async {
  //   final Uri urlParsed = Uri.parse(url);
  //   if (await canLaunchUrl(urlParsed)) {
  //     await launchUrl(urlParsed);
  //   } else {
  //     throw "Couldn lauch the url $url";
  //   }
  // }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }
}
