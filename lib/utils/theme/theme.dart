import 'package:flutter/material.dart';
import 'package:project/utils/theme/text/text_theme.dart';
import 'package:project/utils/theme/textfiled/textfiledTheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: AppTextfiledTheme.inputLight,
    textTheme: AppTextTheme.lightTextTheme,
  );
}
