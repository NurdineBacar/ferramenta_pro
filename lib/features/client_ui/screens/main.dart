import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/client_ui/controller/navigationController.dart';
import 'package:project/utils/device/device_utility.dart';

class ClientMain extends StatelessWidget {
  ClientMain({super.key});

  final navController = Get.put(NavigationController());

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
            TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Catalogo"),
            NavigationDestination(
              icon: Icon(Iconsax.shopping_cart),
              label: "Carrinho",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.task_square),
              label: "Reservas",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: "Favoritos",
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Perfil"),
          ],
        ),
      ),
    );
  }
}
