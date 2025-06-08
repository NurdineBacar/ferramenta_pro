import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/data/repositories/profile_controller.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _profileController = Get.put(ProfileController());
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: AppSizes.appBarAuthHeigth),

            Center(
              child: Column(
                children: [
                  Text(
                    "Editar Perfil",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: Helpers.screenWidth(context) * 0.70,
                    child: Text(
                      "Altere os campos com novos dados",

                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 65),

            Form(
              key: _form,
              child: Column(
                children: [
                  // First name and surname
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _profileController.firstName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Insira o primeiro nome";
                            }

                            return null;
                          },
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
                          keyboardType: TextInputType.text,
                          controller: _profileController.lastName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Insira o apelido";
                            }

                            return null;
                          },
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
                    keyboardType: TextInputType.text,
                    controller: _profileController.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira oemail";
                      } else if (!value.isEmail) {
                        return "Insira um email valido";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.sms),
                      labelText: "Email",
                      prefixText: "| ",
                      hintText: "Insira seu email",
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _profileController.phoneNumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira o telefone";
                      } else if (!value.isPhoneNumber) {
                        return "insira um numero de telefone valido";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.call),
                      labelText: "Telefone",
                      prefixText: "| ",
                      hintText: "Insira seu telefone",
                    ),
                  ),
                  SizedBox(height: 16),

                  SizedBox(height: 75),

                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: ElevatedButton(
                      onPressed: () => _handleUpdateProfile(context),
                      child: Text("Salvar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleUpdateProfile(BuildContext context) async {
    if (_form.currentState!.validate()) {
      await _profileController.updateProfile();
    } else {
      Helpers.warnigSnackbar(
        title: "Info",
        message: "Preencha todos os campos",
      );
    }
  }
}
