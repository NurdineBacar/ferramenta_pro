import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/data/modal/user.dart';
import 'package:project/features/client_ui/controller/my_cart_controller.dart';
import 'package:project/features/client_ui/controller/navigationController.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/local_storage/local_storage.dart';

class HomeHeader extends StatelessWidget {
  final bool? showButtonCart;

  HomeHeader({super.key, this.showButtonCart = true});
  final controller = Get.put(NavigationController());
  final _controllerData = Get.put(HomeHeaderController());
  final _cartController = Get.put(MyCartController.instance);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 65,
              height: 65,
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.primary,
              ),
              child: Text(
                _controllerData.name.value.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bem Vindo!",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 2),
                Text(
                  _controllerData.name.value.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),

        showButtonCart == true
            ? SizedBox(
              width: 50, // largura maior que o container do ícone
              height: 50, // altura maior que o container do ícone
              child: Stack(
                clipBehavior:
                    Clip.none, // permite que o badge fique fora do Stack
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.put(NavigationController()).selectedIndex.value = 1;
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color:
                            AppDeviceUtils.isDarkMode()
                                ? AppColors.primary
                                : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Iconsax.shopping_cart),
                    ),
                  ),
                  Obx(() {
                    if (_cartController.cartList.isEmpty) {
                      return SizedBox();
                    }

                    return Positioned(
                      right: 0, // badge um pouco para fora à direita
                      top: -8, // badge um pouco acima
                      child: Container(
                        width: 25,
                        height: 25,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              AppDeviceUtils.isDarkMode()
                                  ? Colors.white
                                  : AppColors.primary,
                        ),
                        child: Text(
                          "${_cartController.cartList.length}",
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
            : SizedBox.shrink(),
      ],
    );
  }
}

class HomeHeaderController extends GetxController {
  static HomeHeaderController get instance => Get.find();
  // Instância do seu StorageUtils
  final StorageUtils _storage = StorageUtils();

  final RxString name = "".obs;
  final RxString email = "".obs;
  final RxString role = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dadosUser();
  }

  void dadosUser() {
    final Map<String, dynamic> userData = _storage.readData("user_data");

    name.value = userData["name"] ?? "";
    role.value = userData["role"] ?? "";
    email.value = userData["email"] ?? "";
  }
}
