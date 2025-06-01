import 'package:flutter/material.dart';
import 'package:project/features/auth/screens/sign-up/widgets/sign_up_form.dart';
import 'package:project/features/auth/screens/sign-up/widgets/sign_up_header.dart';
import 'package:project/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppSizes.appBarAuthHeigth),
                // Headeder
                SignUpHeader(),
                SizedBox(height: 60),

                // Form
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
