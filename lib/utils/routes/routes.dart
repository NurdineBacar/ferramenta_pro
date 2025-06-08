import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/admin_ui/screens/main.dart';
import 'package:project/features/auth/screens/sign-in/sign_in.dart';
import 'package:project/features/client_ui/screens/main.dart';
import 'package:project/utils/local_storage/local_storage.dart';
import 'package:project/utils/logging/logger.dart';

class AppRoutes {
  // Rotas nomeadas
  static const String signIn = '/signin';
  static const String adminHome = '/admin/home';
  static const String clientHome = '/client/home';

  // Storage keys
  static const String _tokenKey = 'access_token';
  static const dynamic _userDataKey = 'user_data';

  // Instância do seu StorageUtils
  static final StorageUtils _storage = StorageUtils();

  // Gerenciador de rotas com GetX
  static List<GetPage> getPages = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(
      name: adminHome,
      page: () => AdminMain(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: clientHome,
      page: () => ClientMain(),
      middlewares: [AuthMiddleware()],
    ),
  ];

  // Verifica autenticação
  static bool get isLoggedIn {
    return _storage.readData<String>(_tokenKey) != null;
  }

  // Verifica se é admin
  static bool get isAdmin {
    final userData = _storage.readData<Map<String, dynamic>>(_userDataKey);
    return userData != null && userData['role'] == 'admin';
  }

  // Rota inicial baseada no estado de login
  static String get initialRoute {
    if (!isLoggedIn) return signIn;
    return isAdmin ? adminHome : clientHome;
  }

  // Métodos para gerenciar sessão
  static Future<void> saveUserSession(
    String token,
    Map<String, dynamic> userData,
  ) async {
    try {
      if (token.isEmpty) throw 'Token cannot be empty';
      if (userData.isEmpty) throw 'User data cannot be empty';

      await _storage.saveData(_tokenKey, token);
      await _storage.saveData(_userDataKey, userData);
    } catch (e) {
      AppLoggerHelper.error('Failed to save session: $e');
      rethrow;
    }
  }

  static Future<void> clearUserSession() async {
    await _storage.removedata(_tokenKey);
    await _storage.removedata(_userDataKey);

    Get.offAll(() => SignInScreen());
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AppRoutes.isLoggedIn) {
      return RouteSettings(name: AppRoutes.signIn);
    }

    if (route == AppRoutes.adminHome && !AppRoutes.isAdmin) {
      Get.snackbar('Acesso negado', 'Você não tem permissão para esta área');
      return RouteSettings(name: AppRoutes.clientHome);
    }

    return null;
  }
}
