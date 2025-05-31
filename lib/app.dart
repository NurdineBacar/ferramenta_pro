import 'package:flutter/material.dart';
import 'package:project/features/auth/screens/sign_in.dart';
import 'package:project/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: SignInScreen());
  }
}
