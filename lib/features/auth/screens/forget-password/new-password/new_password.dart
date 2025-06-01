import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: AppSizes.appBarAuthHeigth),

                // header
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppTextConst.newPasswordTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 15),
                      Text(
                        AppTextConst.newPasswordSubTitle1,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: 5),
                      Text(
                        AppTextConst.newPasswordSubTitle2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),

                // Form
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        inputFormatters: [LengthLimitingTextInputFormatter(8)],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.key),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.eye),
                          ),
                          prefixText: "| ",
                          labelText: "Nova senha",
                          hintText: "Insira a sua nova senha",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        inputFormatters: [LengthLimitingTextInputFormatter(8)],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.eye),
                          ),
                          prefixText: "| ",
                          labelText: "Confirmar nova senha",
                          hintText: "Confirma a sua nova senha",
                        ),
                      ),
                      SizedBox(height: 70),
                      SizedBox(
                        width: Helpers.screenWidth(context),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.put(AuthController()).getToSignIn();
                          },
                          child: Text("Redefinir Senha"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
