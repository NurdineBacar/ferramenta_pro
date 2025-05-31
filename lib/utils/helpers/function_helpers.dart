import 'package:flutter/widgets.dart';

class Helpers {
  Helpers._();

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
