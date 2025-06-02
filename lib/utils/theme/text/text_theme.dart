import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: const TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: const TextStyle(color: Colors.black, fontSize: 14),
    labelSmall: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.primary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

    titleMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
    labelSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: AppColors.primary,
    ),
  );
}
