import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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

                  SizedBox(height: 75),

                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
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
}
