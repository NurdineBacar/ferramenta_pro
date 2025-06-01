import 'package:flutter/material.dart';
import 'package:project/utils/theme/elevetedButton/eleveted_button.dart';
import 'package:project/utils/theme/text/text_theme.dart';
import 'package:project/utils/theme/textfiled/textfiledTheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    inputDecorationTheme: AppTextfiledTheme.inputLight,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevetedButtonTheme.lightElevatedButton,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    inputDecorationTheme: AppTextfiledTheme.inputLight,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevetedButtonTheme.lightElevatedButton,
  );
}
