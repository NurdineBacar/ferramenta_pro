import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/features/admin_ui/screens/main.dart';
import 'package:project/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: AdminMain(),
    );
  }
}
