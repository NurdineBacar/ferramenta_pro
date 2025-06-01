import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class SignForm extends StatelessWidget {
  SignForm({super.key});

  final RxBool showPassword = false.obs; // Mantenha fora do build

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sms, color: Colors.grey),
              labelText: "Email",
              prefixText: "| ",
              hintText: "Insira seu email",
            ),
          ),
          const SizedBox(height: 25),
          Obx(
            () => TextFormField(
              obscureText: !showPassword.value,
              obscuringCharacter: "*",
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.key, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword.value = !showPassword.value;
                  },
                  icon: Icon(
                    showPassword.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                ),
                labelText: "Senha",
                prefixText: "| ",
                hintText: "Insira sua senha",
              ),
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.put(AuthController()).getToForgetPassword();
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
          const SizedBox(height: 30),
          SizedBox(
            width: Helpers.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Entrar"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
