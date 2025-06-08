import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final RxBool showPassword1 = false.obs;
  final RxBool showPassword2 = false.obs;

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
                      Obx(
                        () => TextFormField(
                          obscureText: !showPassword1.value ? true : false,
                          obscuringCharacter: "*",
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.key),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showPassword1.value = !showPassword1.value;
                              },
                              icon: Icon(
                                showPassword1.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                              ),
                            ),
                            prefixText: "| ",
                            labelText: "Nova senha",
                            hintText: "Insira a sua nova senha",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => TextFormField(
                          obscureText: !showPassword2.value ? true : false,
                          obscuringCharacter: "*",
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showPassword2.value = !showPassword2.value;
                              },
                              icon: Icon(
                                showPassword2.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                              ),
                            ),
                            prefixText: "| ",
                            labelText: "Confirmar nova senha",
                            hintText: "Confirma a sua nova senha",
                          ),
                        ),
                      ),
                      SizedBox(height: 70),
                      SizedBox(
                        width: Helpers.screenWidth(context),
                        child: ElevatedButton(
                          onPressed: () {},
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
