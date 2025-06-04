import 'package:flutter/material.dart';

class AppDropDownTheme {
  AppDropDownTheme._();

  static DropdownMenuThemeData lightDropDownTheme = DropdownMenuThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: Colors.grey,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
      elevation: WidgetStatePropertyAll<double>(6),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 8),
      ),
    ),
    textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  );
}
