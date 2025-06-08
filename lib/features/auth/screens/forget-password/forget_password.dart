import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: AppSizes.appBarAuthHeigth),
            // haeder
            Center(
              child: Column(
                children: [
                  Text(
                    AppTextConst.forgetPTitle1,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 15),
                  Text(
                    AppTextConst.forgetPSubTitle1,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),

            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.sms),
                      prefixText: "| ",
                      labelText: "Email",
                      hintText: "insira seu email",
                    ),
                  ),
                  SizedBox(height: 65),
                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Verificar"),
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
