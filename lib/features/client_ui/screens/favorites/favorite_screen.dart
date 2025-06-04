import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/item_equipament.dart';
import 'package:project/features/client_ui/model/cart_item_model.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/features/client_ui/screens/details/details_screen.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_categorie_item.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_header.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // header
          HomeHeader(),
          const SizedBox(height: 30),

          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.search_normal_1),
              prefixText: "| ",
              labelText: "Pesquisar equipamento",
              hintText: "Insira o nome do equipamento",
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                itemCount: EquipamentList.equipments.length,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // para não conflitar com o scroll externo
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final equipament = EquipamentList.equipments[index];
                  return ItemEquipament(
                    equipement: equipament,
                    onAction: () {
                      Get.to(
                        () => DetailsEquipamentScreen(),
                        transition: Transition.cupertino,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 600),
                        arguments: {"equipament": equipament},
                      );
                    },
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class BookerItem extends StatelessWidget {
  final CartItemModel item;

  const BookerItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color:
              AppDeviceUtils.isDarkMode()
                  ? Colors.transparent
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(14),
          border:
              AppDeviceUtils.isDarkMode()
                  ? Border.all(width: 2, color: AppColors.primary!)
                  : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(item.imageAsset, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 15),
            // Datas
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: Theme.of(context).textTheme.labelLarge),
                Text.rich(
                  TextSpan(
                    text: "Periodo: ",
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [TextSpan(text: item.period)],
                  ),
                ),
                SizedBox(height: 14),
                Text.rich(
                  TextSpan(
                    text: "Tempo Restante: ",
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [TextSpan(text: "2 dias")],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
