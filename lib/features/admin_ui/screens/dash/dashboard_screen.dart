import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/admin_ui/screens/admin_details/admin_details_booker.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_header.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            // header
            HomeHeader(showButtonCart: false),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        Helpers.size(context).height -
                        155, // Adjust this value based on your header height
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AdminDashCard(
                            title: "Equipamentos",
                            value: 60,
                            dateUpdate: "12/12/2025",
                          ),
                          SizedBox(width: 16),
                          AdminDashCard(
                            title: "Clientes",
                            value: 160,
                            dateUpdate: "02/12/2025",
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      AdminFacturationCard(value1: 25000.0, value2: 12000.0),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reservas recentes",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: EquipamentList.equipments.length,
                        itemBuilder: (_, index) {
                          final equipament = EquipamentList.equipments[index];
                          return Column(
                            children: [
                              AdminBookerItem(item: equipament),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminBookerItem extends StatelessWidget {
  final Equipament item;
  final VoidCallback? onAction;

  const AdminBookerItem({super.key, required this.item, this.onAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => AdminDetailsBookerScreen(),
          arguments: {"equipament": item},
        );
      },
      child: Container(
        width: Helpers.screenWidth(context),
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border:
              AppDeviceUtils.isDarkMode()
                  ? Border.all(width: 2, color: Colors.grey)
                  : null,
          color:
              AppDeviceUtils.isDarkMode()
                  ? Colors.transparent
                  : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Iconsax.book_square, size: 55),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Periodo: ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [TextSpan(text: "2 dias")],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Cliente: ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: "Marcel nota",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.primary!),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Em uso",
                    style: TextStyle(fontSize: 11, color: AppColors.primary),
                  ),
                ),

                SizedBox(width: 5),
                Icon(Iconsax.direct_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdminDashCard extends StatelessWidget {
  final String title;
  final int value;
  final String dateUpdate;
  const AdminDashCard({
    super.key,
    required this.title,
    required this.value,
    required this.dateUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey[300]!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            Text("$value", style: Theme.of(context).textTheme.headlineLarge),
            Text.rich(
              TextSpan(
                text: "Ultima atualizacao: ",
                style: Theme.of(context).textTheme.bodySmall,
                children: [TextSpan(text: dateUpdate)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminFacturationCard extends StatelessWidget {
  final double? value1, value2;
  const AdminFacturationCard({super.key, this.value1 = 0, this.value2 = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.screenWidth(context),
      height: 155,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Faturação",
            style: TextStyle(
              fontSize: 24,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mes passado",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$value1 MT",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Este mes",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$value2 MT",
                      style: Theme.of(context).textTheme.headlineMedium,
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
