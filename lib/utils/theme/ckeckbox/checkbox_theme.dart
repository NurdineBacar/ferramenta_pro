import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._();

  static CheckboxThemeData lightCheboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(width: 2, color: Colors.grey),

    fillColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return AppColors.primary!;
      } else {
        return Colors.transparent;
      }
    }),
  );

  static CheckboxThemeData darkCheboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(width: 2, color: Colors.grey),
    checkColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.transparent;
      }
    }),
    fillColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return AppColors.primary!;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
