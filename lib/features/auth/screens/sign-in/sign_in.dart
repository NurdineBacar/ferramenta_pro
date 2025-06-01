import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/features/auth/screens/sign-in/widgets/sign_in_footer.dart';
import 'package:project/features/auth/screens/sign-in/widgets/sign_in_form.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useAuthController = Get.put(AuthController());

    useAuthController.checkLogged();

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Conteúdo principal rolável
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: AppSizes.appBarAuthHeigth),
                    Text(
                      AppTextConst.signInTitle1,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppTextConst.signInSubTitle1,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 65),

                    // Formulário
                    SignForm(),
                  ],
                ),
              ),
            ),

            // Footer fixo com botão único
            SignInFooter(),
          ],
        ),
      ),
    );
  }
}
