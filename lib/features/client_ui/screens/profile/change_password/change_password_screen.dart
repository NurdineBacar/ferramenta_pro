import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
                    "Mudar Senha",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: Helpers.screenWidth(context) * 0.70,
                    child: Text(
                      "Preencha os campos com a nova palavra-passe",

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
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.key),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.eye),
                      ),
                      labelText: "Nova palavra-passe",
                      prefixText: "| ",
                      hintText: "Insira sua nova palavra passe",
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.key),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.eye),
                      ),
                      labelText: "Confirmar sua palavra-passe",
                      prefixText: "| ",
                      hintText: "Confirmar sua nova palavra passe",
                    ),
                  ),

                  SizedBox(height: 55),
                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Alterar"),
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
