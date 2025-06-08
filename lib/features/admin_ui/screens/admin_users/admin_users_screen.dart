import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/admin_ui/screens/admin_users/create_user/create_user_Screen.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/common/widgets/home_header.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class AdminUsersScreen extends StatelessWidget {
  AdminUsersScreen({super.key});

  final UserFilterController controller = Get.put(UserFilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            HomeHeader(showButtonCart: false),
            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal_1),
                      prefixText: "| ",
                      labelText: "Pesquisar reserva",
                      hintText: "Insira o nome do cliente/epi",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 55,
                  height: 55,
                  child: FilledButton(
                    onPressed: () {
                      Get.to(() => CreateUserScreen());
                    },
                    child: const Icon(Iconsax.add, size: 30),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ⬇️ Dropdown reativo usando GetX
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedValue.value,
                      onChanged: controller.changeSelected,
                      isExpanded: true,
                      hint: const Text("Escolha o perfil"),
                      icon: const Icon(Iconsax.arrow_square_down),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.filter),
                        labelText: "Perfil Acesso",
                      ),
                      items:
                          controller.items
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedValue.value,
                      onChanged: controller.changeSelected,
                      isExpanded: true,
                      hint: const Text("Escolha o perfil"),
                      icon: const Icon(Iconsax.arrow_square_down),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.filter),
                        labelText: "Estado",
                      ),
                      elevation: 0,

                      items:
                          controller.items
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 📋 Lista de usuários
            Expanded(
              child: ListView.builder(
                itemCount: EquipamentList.equipments.length,
                itemBuilder: (_, index) {
                  final item = EquipamentList.equipments[index];

                  return Column(
                    children: [
                      AdminUserCard(item: item),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class AdminUserCard extends StatelessWidget {
  final Equipament item;
  const AdminUserCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.screenWidth(context),
      height: 175,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border:
            AppDeviceUtils.isDarkMode()
                ? Border.all(width: 2, color: Colors.grey.shade400)
                : null,
        color:
            AppDeviceUtils.isDarkMode()
                ? Colors.transparent
                : Colors.grey.shade200,
      ),
      child: Column(
        children: [
          // User Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.user, size: 65),
              SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marcel Nota",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Telefone: 84 123 1234",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Email: marcelnota@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Perfil acesso: Adminitrador",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 5),

          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                textStyle: TextStyle(fontSize: 12),
              ),
              child: Text(
                "Desativar",
                style: TextStyle(color: Helpers.itemType("primary")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// lib/features/admin_ui/controllers/user_filter_controller.dart

class UserFilterController extends GetxController {
  // Lista de perfis disponíveis
  final List<String> items = ['Administrador', 'Editor', 'Visualizador'];

  // Perfil selecionado (reativo)
  final selectedValue = RxnString('Administrador');

  void changeSelected(String? newValue) {
    selectedValue.value = newValue;
  }
}
