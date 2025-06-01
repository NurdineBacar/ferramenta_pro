import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: AppSizes.appBarAuthHeigth),

            // header
            Center(
              child: Column(
                children: [
                  Text(
                    AppTextConst.otpTitle1,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 15),
                  Text(
                    AppTextConst.otpSubTitle1,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),

            SizedBox(height: 80),

            Form(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputOpt(),
                      InputOpt(),
                      InputOpt(),
                      InputOpt(),
                      InputOpt(),
                    ],
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        text: AppTextConst.otpDidntreceive,
                        children: [
                          TextSpan(
                            text: AppTextConst.otpResend,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.put(AuthController()).getToNewPassword();
                      },
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

class InputOpt extends StatelessWidget {
  // final TextEditingController inputName;
  const InputOpt({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        // controller: inputName,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
