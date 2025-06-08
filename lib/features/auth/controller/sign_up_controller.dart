import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/modal/user.dart';
import 'package:project/features/auth/screens/sign-in/sign_in.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  final isLoading = false.obs;

  bool isFormValid() {
    return firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        phoneNumber.text.isNotEmpty &&
        password.text.isNotEmpty &&
        passwordConfirm.text.isNotEmpty;
  }

  bool matchPassword() {
    return password.text == passwordConfirm.text;
  }

  Future<void> signUp(UserModel user) async {
    try {
      final resp = await HttpClient.post("user/store", {
        "name": user.name.toUpperCase(),
        "email": user.email,
        "phone_number": user.phoneNumber,
        "password": user.password,
        "role": "client",
      });

      if (resp.statusCode != 200 && resp.statusCode != 201) {
        final error = jsonDecode(resp.body);
        throw error["message"] ?? "Falha na criacao de utilizador";
      }

      final respJson = jsonDecode(resp.body);

      if (respJson["success"]) {
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Utilizador ${user.name} criado com successo!",
        );

        Future.delayed(Duration(seconds: 3), () {
          Get.offAll(() => SignInScreen());
        });
      } else {
        Helpers.errorSnackbar(title: "Erro", message: respJson["message"]);
      }
    } catch (e) {
      AppLoggerHelper.error('Authentication error: $e');
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }
}
