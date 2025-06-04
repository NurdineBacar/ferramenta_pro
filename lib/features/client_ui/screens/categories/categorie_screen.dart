import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/item_equipament.dart';
import 'package:project/features/client_ui/model/categories.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/features/client_ui/screens/details/details_screen.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  Category get category {
    final args = Get.arguments;
    if (args != null &&
        args is Map<String, dynamic> &&
        args.containsKey('categorie')) {
      return args['categorie'] as Category;
    }
    throw Exception('Categoria não encontrada nos argumentos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          category.label,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: Helpers.screenWidth(context),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.search_normal_1),
                  prefixText: "| ",
                  labelText: "Pesquisar equipamento",
                  hintText: "Insira o nome do equipamento",
                ),
              ),
            ),
            SizedBox(height: 25),

            Expanded(
              child: GridView.builder(
                itemCount: EquipamentList.equipments.length,
                shrinkWrap: true,
                // para não conflitar com o scroll externo
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
                        arguments: equipament,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Header
          ],
        ),
      ),
    );
  }
}
