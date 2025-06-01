import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/features/auth/screens/forget-password/forget_password.dart';
import 'package:project/features/auth/screens/forget-password/new-password/new_password.dart';
import 'package:project/features/auth/screens/forget-password/otp_code/verify_otp.dart';
import 'package:project/features/auth/screens/sign-in/sign_in.dart';
import 'package:project/features/auth/screens/sign-up/sign_up.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  Rx<bool> isLogged = false.obs;

  void checkLogged() {
    if (!isLogged.value) {
      Future.microtask(() => Get.to(() => SignInScreen()));
    } else {}
  }

  void getToCreateAccout() {
    Get.to(
      () => SignUpScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 400),
    );
  }

  void getToForgetPassword() {
    Get.to(
      () => ForgetPasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 400),
    );
  }

  void getToSignIn() {
    Get.offAll(
      () => SignInScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 400),
    );
  }

  void getToSignUp() {
    Get.to(
      () => SignUpScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
    );
  }

  void getToOtpVerification() {
    Get.to(
      () => VerifyOtpScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
    );
  }

  void getToNewPassword() {
    Get.to(
      () => NewPasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
    );
  }
}
