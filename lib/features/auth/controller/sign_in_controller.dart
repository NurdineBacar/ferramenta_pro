import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project/features/auth/screens/forget-password/forget_password.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';
import 'package:project/utils/routes/routes.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> signIn({required String email, required String password}) async {
    try {
      final response = await HttpClient.post('auth/sign-in', {
        'email': email,
        'password': password,
      });

      if (response.statusCode != 200 && response.statusCode != 201) {
        final error = jsonDecode(response.body);
        throw error['message'] ??
            'Falha na autenticação (${response.statusCode})';
      }

      final data = jsonDecode(response.body);
      AppLoggerHelper.debug('Response data: $data');

      final accessToken = data['access_token']?.toString();
      if (accessToken == null || accessToken.isEmpty) {
        throw 'Token de acesso não encontrado na resposta';
      }

      final decodedToken = JwtDecoder.decode(accessToken);

      if (decodedToken.isEmpty) {
        throw 'Token inválido ou malformado';
      }

      final userData = decodedToken['user'] as Map<String, dynamic>? ?? {};
      if (userData.isEmpty) {
        throw 'Dados do usuário não encontrados no token';
      }

      await AppRoutes.saveUserSession(accessToken, userData);

      Helpers.successSnackbar(
        title: "Sucesso",
        message: "Bem vindo ${userData['name']}",
      );
      Future.delayed(Duration(seconds: 1), () {
        Get.offAllNamed(AppRoutes.initialRoute);
      });
    } on FormatException catch (e) {
      AppLoggerHelper.error('JSON parsing error: $e');
      Get.snackbar('Erro', 'Resposta do servidor inválida');
    } catch (e) {
      AppLoggerHelper.error('Authentication error: $e');
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }

  void getToForgetPassword() {
    Get.to(() => ForgetPasswordScreen());
  }
}
