import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/admin_ui/controller/admin_navigator_controller.dart';
import 'package:project/utils/device/device_utility.dart';

class AdminMain extends StatelessWidget {
  AdminMain({super.key});

  final navController = Get.put(AdminNavigatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => navController.screens[navController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          height: 80,
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected:
              (value) => navController.selectedIndex.value = value,
          indicatorColor: Colors.blue.shade600.withOpacity(0.2),
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Inicio"),
            NavigationDestination(
              icon: Icon(Iconsax.book_square),
              label: "Reservas",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.task_square),
              label: "Epis",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.people),
              label: "Utilizadores",
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Perfil"),
          ],
        ),
      ),
    );
  }
}
