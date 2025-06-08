import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/auth/controller/auth.controller.dart';
import 'package:project/features/profile/change_password/change_password_screen.dart';
import 'package:project/features/profile/editar_perfil/edit_profile.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: AppSizes.appBarHeigth),

            // Header
            ProfileHeader(),
            SizedBox(height: 65),

            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(
                          () => EditProfileScreen(),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.edit, size: 25),
                              SizedBox(width: 10),
                              Text(
                                "Editar Perfil",
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                          Icon(Iconsax.arrow_right, size: 25),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: Helpers.screenWidth(context),
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(
                          () => ChangePasswordScreen(),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 600),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.lock, size: 25),
                              SizedBox(width: 10),
                              Text(
                                "Mudar Senha",
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                          Icon(Iconsax.arrow_right, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: Helpers.screenWidth(context),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.red),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  authController.signUp();
                },
                child: Text(
                  "Terminar sessão",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.primary!),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  "M",
                  style: TextStyle(
                    fontSize: 76,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 15),
          Text(
            "Marcel Paulo",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 10),
          Text("Cliente", style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
