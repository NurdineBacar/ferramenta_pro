import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/item_equipament.dart';
import 'package:project/features/client_ui/controller/client_epis_controller.dart';
import 'package:project/features/client_ui/model/categories.dart';
import 'package:project/features/client_ui/screens/categories/categorie_screen.dart';
import 'package:project/features/client_ui/screens/details/details_screen.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_banner.dart';
import 'package:project/features/client_ui/screens/home/widgets/home_categorie_item.dart';
import 'package:project/common/widgets/home_header.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_string.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _epiController = Get.put(ClientEpisController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Header
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
                child: Column(
                  children: [
                    const HomeBanner(),

                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppTextConst.homeCategorieTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Categorias em duas linhas com scroll horizontal
                    SizedBox(
                      height: 100, // altura suficiente para os itens
                      child: ListView.builder(
                        itemCount: CategoriesList.listOfCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final categorie =
                              CategoriesList.listOfCategories[index];
                          return CategoryItem(
                            label: categorie.label,
                            icon: categorie.icon,
                            onTap: () {
                              Get.to(
                                () => CategorieScreen(),
                                arguments: {"categorie": categorie},
                              );
                            },
                          );
                        },
                      ),
                    ),

                    // Equipamentes
                    Obx(() {
                      if (_epiController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }
                      return GridView.builder(
                        itemCount: _epiController.epiList.length,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // para não conflitar com o scroll externo
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                        itemBuilder: (_, index) {
                          final epi = _epiController.epiList[index];
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
