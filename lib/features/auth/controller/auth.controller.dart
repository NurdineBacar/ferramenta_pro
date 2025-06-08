import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project/features/auth/screens/sign-in/sign_in.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';
import 'package:project/utils/routes/routes.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final RxBool isLoading = false.obs;
  final RxBool isLogged = false.obs;

  // actions
  Future<void> signIn({required String email, required String password}) async {
    try {
      isLoading.value = true;

      final response = await HttpClient.post('auth/sign-in', {
        'email': email,
        'password': password,
      });

      // Validate response status
      if (response.statusCode != 200 && response.statusCode != 201) {
        final error = jsonDecode(response.body);
        throw error['message'] ??
            'Falha na autenticação (${response.statusCode})';
      }

      // Parse response body
      final data = jsonDecode(response.body);
      AppLoggerHelper.debug('Response data: $data');

      // Validate token presence
      final accessToken = data['access_token']?.toString();
      if (accessToken == null || accessToken.isEmpty) {
        throw 'Token de acesso não encontrado na resposta';
      }

      // Decode and verify JWT token
      final decodedToken = JwtDecoder.decode(accessToken);
      AppLoggerHelper.debug('Decoded token: $decodedToken');

      if (decodedToken.isEmpty) {
        throw 'Token inválido ou malformado';
      }

      // Extract user data with null checks
      final userData = decodedToken['user'] as Map<String, dynamic>? ?? {};
      if (userData.isEmpty) {
        throw 'Dados do usuário não encontrados no token';
      }

      // Save session with validated data
      await AppRoutes.saveUserSession(accessToken, userData);
      isLogged.value = true;

      // Navigate to appropriate home screen
      Get.offAllNamed(AppRoutes.initialRoute);
    } on FormatException catch (e) {
      AppLoggerHelper.error('JSON parsing error: $e');
      Get.snackbar('Erro', 'Resposta do servidor inválida');
    } catch (e) {
      AppLoggerHelper.error('Authentication error: $e');
      Get.snackbar(
        'Erro',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp() async {
    try {
      await AppRoutes.clearUserSession();
    } catch (e) {
      Get.snackbar("Erro", e.toString());
    }
  }

  // Go tos
  void checkLogged() {
    if (!isLogged.value) {
      Future.microtask(() => Get.to(() => SignInScreen()));
    } else {}
  }
}
