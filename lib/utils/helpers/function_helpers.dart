import 'package:flutter/widgets.dart';

class Helpers {
  Helpers._();

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
