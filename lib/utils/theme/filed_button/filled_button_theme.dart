import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppFilledButtonTheme {
  AppFilledButtonTheme._();

  static FilledButtonThemeData lightFilledButton = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: Colors.grey,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      iconColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
    ),
  );

  static FilledButtonThemeData darkFilledButton = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 2, color: AppColors.primary!),
      ),
      iconColor: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 10),
    ),
  );
}
