import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/home_header.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/features/admin_ui/controller/epi_controller.dart';
import 'package:project/features/admin_ui/screens/admin_epis/craete_epis/create_apis_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/image.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class AdminEpisScreen extends StatelessWidget {
  AdminEpisScreen({super.key});

  final _epiController = Get.put(EpiController());

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
              child: Obx(() {
                if (_epiController.isClosed) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (_epiController.listEpis.value.length == 0) {
                  return Center(
                    child: Text(
                      "Nenhum equipamento",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: _epiController.listEpis.length,
                  itemBuilder: (_, index) {
                    final item = _epiController.listEpis.value[index];

                    return Column(
                      children: [
                        AdminEquipamentCard(item: item),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class AdminEquipamentCard extends StatelessWidget {
  final EpiModel item;
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
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 110,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      item.images.length > 0
                          ? Image.asset(item.images[0], fit: BoxFit.cover)
                          : Image.asset(AppImage.noImage, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 14),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Periodo: ${item.minDays} - ${item.maxDays}  dias",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  Text(
                    item.createdAt.toString().substring(0, 10),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

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
                              Text(
                                "Editar",
                                style: TextStyle(color: Colors.black),
                              ),
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
                          child: Icon(
                            Iconsax.trash,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            child: Row(
              children: [
                SizedBox(
                  width: 110,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        item.images.isNotEmpty
                            ? Image.asset(item.images[0], fit: BoxFit.cover)
                            : null,
                  ),
                ),
                SizedBox(width: 14),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Periodo: ${item.minDays} - ${item.maxDays}  dias",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),

                    Text(
                      item.createdAt.toString().substring(0, 10),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

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
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => CreateApisScreen(),
                                transition: Transition.cupertino,
                                arguments: {"epi": item},
                              );
                            },
                            child: Container(
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
                                  Icon(
                                    Iconsax.edit,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Editar",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Get.put(
                                EpiController(),
                              ).deleteEpi(item.id.toString());
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                              child: Icon(
                                Iconsax.trash,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
