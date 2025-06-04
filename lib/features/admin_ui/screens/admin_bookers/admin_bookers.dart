import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/admin_ui/models/booker_categorie.dart';
import 'package:project/features/admin_ui/screens/dash/dashboard_screen.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_header.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class AdminBookersScreen extends StatelessWidget {
  AdminBookersScreen({super.key});

  final List<BookerCategorie> bookerCategorie = [
    BookerCategorie(title: "Todas", type: "all"),
    BookerCategorie(title: "Em uso", type: "primary"),
    BookerCategorie(title: "Pago", type: "success"),
    BookerCategorie(title: "Atrasado", type: "destructive"),
  ];

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

            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.search_normal_1),
                prefixText: "| ",
                labelText: "Pesquisar reserva",
                hintText: "Insira o nome do cliente/epi",
              ),
            ),
            SizedBox(height: 15),

            SizedBox(
              width: Helpers.screenWidth(context),
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookerCategorie.length,
                itemBuilder: (_, index) {
                  final item = bookerCategorie[index];

                  return Row(
                    children: [
                      AdminCategorieBooker(type: item.type, title: item.title),
                      SizedBox(width: 10),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: EquipamentList.equipments.length,
                itemBuilder: (_, index) {
                  final item = EquipamentList.equipments[index];

                  return Column(
                    children: [
                      AdminBookerItem(item: item),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminCategorieBooker extends StatelessWidget {
  final String type;
  final String title;

  const AdminCategorieBooker({
    super.key,
    required this.type,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.5, color: Helpers.itemType(type)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Helpers.itemType(type),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
