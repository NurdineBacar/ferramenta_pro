import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppOutlineButtonTheme {
  AppOutlineButtonTheme._();

  static OutlinedButtonThemeData ligthOutlineButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2, color: AppColors.primary!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
          iconColor: AppColors.primary,
        ),
      );
}
