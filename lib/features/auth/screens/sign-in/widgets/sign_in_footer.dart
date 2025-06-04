import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_string.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final useAuthController = Get.put(AuthController());

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: () {
          // Ação de criar conta
          useAuthController.getToSignUp();
        },
        child: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            text: '${AppTextConst.signInDontHaveAccount} ',
            children: [
              TextSpan(
                text: AppTextConst.signInCreate,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
