import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/features/auth/screens/sign-in/sign_in.dart';
import 'package:project/features/client_ui/screens/details/details_screen.dart';
import 'package:project/features/client_ui/screens/profile/editar_perfil/edit_profile.dart';
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
      home: SignInScreen(),
    );
  }
}
