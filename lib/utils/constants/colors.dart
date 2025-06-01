import 'package:flutter/material.dart';

// This class conains all the class tha will be sued on the aplication
class AppColors {
  AppColors._();

  // App BAsic colors
  static Color? primary = Color(0xFF04C1E3);
  static Color secondary = Colors.blue;
  static Color? accent = Colors.brown[300];

  // Text Colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.grey;
  static const Color textWhite = Colors.white;

  // BackgoundColors
  static const Color light = Colors.white;
  static const Color dark = Colors.black;
  static const Color primaryBackground = Colors.white;

  // Background Container colors
  static const Color lightContainer = Colors.white;
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // BUtton Colors
  // static const Color buttonPrimary = AppColors.primary;
  // static const Color buttonSecondry = AppColors.secondary;
  static Color? buttonDisable = Colors.grey[400];

  // Border Colors
  static Color? borderPrimary = Colors.grey[600];
  static Color? borderSecondary = Colors.grey[400];

  // Error and Validadtions Colors
  static const Color error = Colors.redAccent;
  static const Color success = Colors.lightGreenAccent;
  static const Color warning = Colors.amberAccent;
  static const Color info = Colors.blueAccent;

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static Color darkerGrey = Colors.grey.shade800;
  static Color darkGrey = Colors.grey.shade700;
  static const Color grey = Colors.grey;
  static Color softGrey = Colors.grey.shade400;
  static Color lightGrey = Colors.grey.shade300;
  static const Color white = Colors.white;
}
