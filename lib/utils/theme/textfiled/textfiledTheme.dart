import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppTextfiledTheme {
  AppTextfiledTheme._();

  static InputDecorationTheme inputLight = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey.shade600,
    suffixIconColor: Colors.grey.shade500,
    floatingLabelStyle: TextStyle(color: AppColors.primary),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.blue.shade300),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: Colors.amber.shade300),
    ),
  );
}
