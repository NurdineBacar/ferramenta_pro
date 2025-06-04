import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

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
}
