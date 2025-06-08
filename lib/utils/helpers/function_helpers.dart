import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Helpers {
  Helpers._();

  static Color itemType(String t) {
    switch (t) {
      case "all":
        return Colors.grey;
      case "destructive":
        return Colors.red;
      case "primary":
        return AppColors.primary!;
      case "success":
        return AppColors.success;
      default:
        return Colors.blue; // or any default color you prefer
    }
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static String truncateText(String text, int? num) {
    if (num != null && text.length > num) {
      return "${text.substring(0, num)}...";
    }
    return text.length > 17 ? "${text.substring(0, 17)}..." : text;
  }

  static void launchUrl(String url) async {
    final Uri urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrlString(urlParsed as String);
    } else {
      throw "Couldn't launch the url $url";
    }
  }

  static void getTo(Widget screen) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.to(
        () => screen,
        transition: Transition.cupertino,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  static void getOffAll(Widget screen) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAll(
        () => screen,
        transition: Transition.cupertino,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  static successSnackbar({
    required String title,
    String message = "",
    duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.primary,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      icon: Icon(Icons.done_all, color: Colors.white),
      duration: Duration(seconds: duration),
    );
  }

  static errorSnackbar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.error,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.close_circle, color: Colors.white),
    );
  }

  static warnigSnackbar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.warning,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.warning_2, color: Colors.white),
    );
  }

  static infoSnackbar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: AppColors.info,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.info_circle, color: Colors.white),
    );
  }
}
