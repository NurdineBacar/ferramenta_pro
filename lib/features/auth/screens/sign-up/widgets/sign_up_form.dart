import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final RxBool showPassword1 = false.obs;
  final RxBool showPassword2 = false.obs;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First name and surname
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    prefixText: "| ",
                    labelText: "Primeiro Nome",
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    prefixText: "| ",
                    labelText: "Apelido",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms),
              labelText: "Email",
              prefixText: "| ",
              hintText: "Insira seu email",
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: "Telefone",
              prefixText: "| ",
              hintText: "Insira seu telefone",
            ),
          ),
          SizedBox(height: 16),
          Obx(
            () => TextFormField(
              obscureText: !showPassword1.value ? true : false,
              obscuringCharacter: "*",
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.key),
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword1.value = !showPassword1.value;
                  },
                  icon: Icon(
                    showPassword1.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                ),
                prefixText: "| ",
                labelText: "Senha",
                hintText: "Insira sua nova senha",
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => TextFormField(
              obscureText: !showPassword2.value ? true : false,
              obscuringCharacter: "*",
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword2.value = !showPassword2.value;
                  },
                  icon: Icon(
                    showPassword2.value ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                ),
                prefixText: "| ",
                labelText: "Confirmar senha",
                hintText: "Confirma sua nova senha",
              ),
            ),
          ),

          SizedBox(height: 75),

          SizedBox(
            width: Helpers.screenWidth(context),
            child: ElevatedButton(
              onPressed: () {
                Get.put(AuthController()).getToTerms();
              },
              child: Text("Criar"),
            ),
          ),
        ],
      ),
    );
  }
}
