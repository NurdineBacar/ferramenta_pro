import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppElevetedButtonTheme {
  AppElevetedButtonTheme._();

  static final lightElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 14),
      textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
