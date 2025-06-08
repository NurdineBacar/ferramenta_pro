import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/auth/controller/sign_in_controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';

class SignForm extends StatelessWidget {
  SignForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final _signInController = Get.put(SignInController());

  final _showPassword = false.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: _signInController.emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sms, color: Colors.grey),
              labelText: "Email",
              prefixText: "| ",
              hintText: "Insira seu email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor insira seu email';
              }
              if (!value.isEmail) {
                return 'Por favor insira um email válido';
              }
              return null;
            },
          ),

          const SizedBox(height: 15),

          // Password Field
          Obx(
            () => TextFormField(
              controller: _signInController.passwordController,
              obscureText: !_showPassword.value,
              obscuringCharacter: "*",
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.key, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () => _showPassword.toggle(),
                  icon: Icon(
                    _showPassword.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                ),
                labelText: "Senha",
                prefixText: "| ",
                hintText: "Insira sua senha",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira sua senha';
                }
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 15),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                _signInController.getToForgetPassword();
              },
              child: Text(
                AppTextConst.signInForgetPassword,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.fontSizeMd,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Sign In Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    _signInController.isLoading.value
                        ? null
                        : () => _handleSignIn(context),
                child:
                    _signInController.isLoading.value
                        ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: Colors.white),
                            SizedBox(width: 15),
                            Text("Verificando..."),
                          ],
                        )
                        : const Text("Entrar"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await _signInController.signIn(
        email: _signInController.emailController.text.trim(),
        password: _signInController.passwordController.text.trim(),
      );
    }
  }
}
