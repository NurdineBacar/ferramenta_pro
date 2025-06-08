import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/item_equipament.dart';
import 'package:project/features/client_ui/controller/client_epis_controller.dart';
import 'package:project/features/client_ui/model/categories.dart';
import 'package:project/features/client_ui/screens/details/details_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CategorieScreen extends StatelessWidget {
  CategorieScreen({super.key});

  final _epiController = Get.put(ClientEpisController());

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
    _epiController.filterByCategorie(category.label);
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
              child: Obx(() {
                if (_epiController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }
                return GridView.builder(
                  itemCount: _epiController.epiListCategorie.length,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // para não conflitar com o scroll externo
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (_, index) {
                    final epi = _epiController.epiListCategorie[index];
                    return ItemEquipament(
                      equipement: epi,
                      onAction: () {
                        Get.to(
                          () => DetailsEquipamentScreen(),
                          transition: Transition.cupertino,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 600),
                          arguments: {"equipament": epi},
                        );
                      },
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 10),
            // Header
          ],
        ),
      ),
    );
  }
}
