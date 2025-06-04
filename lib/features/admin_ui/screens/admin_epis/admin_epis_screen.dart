import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/admin_ui/screens/admin_epis/craete_epis/create_apis_screen.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_header.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class AdminEpisScreen extends StatelessWidget {
  const AdminEpisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            // header
            HomeHeader(showButtonCart: false),
            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.search_normal_1),
                      prefixText: "| ",
                      labelText: "Pesquisar reserva",
                      hintText: "Insira o nome do cliente/epi",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 55,
                  height: 55,
                  child: FilledButton(
                    onPressed: () {
                      Get.to(() => CreateApisScreen());
                    },
                    child: Icon(Iconsax.add, size: 30),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: EquipamentList.equipments.length,
                itemBuilder: (_, index) {
                  final item = EquipamentList.equipments[index];

                  return Column(
                    children: [
                      AdminEquipamentCard(item: item),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class AdminEquipamentCard extends StatelessWidget {
  final Equipament item;
  const AdminEquipamentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.screenWidth(context),
      height: 145,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border:
            AppDeviceUtils.isDarkMode()
                ? Border.all(width: 2, color: AppColors.primary!)
                : null,
        color:
            AppDeviceUtils.isDarkMode()
                ? Colors.transparent
                : Colors.grey.shade200,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/ite.jpeg", fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Parafuso chave estrela",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 2),
              Text(
                "Periodo: 2 - 3 dias",
                style: Theme.of(context).textTheme.titleSmall,
              ),

              Text("20/02/2025", style: Theme.of(context).textTheme.bodyMedium),

              SizedBox(height: 5),
              SizedBox(
                width:
                    AppDeviceUtils.isDarkMode()
                        ? Helpers.screenWidth(context) * 0.51
                        : Helpers.screenWidth(context) * 0.52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.edit, size: 18, color: Colors.black),
                          SizedBox(width: 8),
                          Text("Editar", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.5, color: Colors.red),
                      ),
                      child: Icon(Iconsax.trash, size: 18, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
