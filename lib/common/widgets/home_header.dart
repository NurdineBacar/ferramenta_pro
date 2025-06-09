import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/data/modal/user.dart';
import 'package:project/features/client_ui/controller/my_cart_controller.dart';
import 'package:project/features/client_ui/controller/navigationController.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';
import 'package:project/utils/local_storage/local_storage.dart';

class HomeHeader extends StatelessWidget {
  final bool? showButtonCart;

  const HomeHeader({super.key, this.showButtonCart = true});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    final _controllerData = Get.find<HomeHeaderController>();
    final _cartController = Get.find<MyCartController>();

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary,
                ),
                child: Text(
                  _controllerData.userInitials.value,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem Vindo!",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _controllerData.name.value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),

          if (showButtonCart == true)
            SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () => controller.selectedIndex.value = 1,
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
                      child: const Icon(Iconsax.shopping_cart),
                    ),
                  ),
                  Obx(() {
                    if (_cartController.cartList.isEmpty) {
                      return const SizedBox();
                    }
                    return Positioned(
                      right: 0,
                      top: -8,
                      child: Container(
                        width: 25,
                        height: 25,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              AppDeviceUtils.isDarkMode()
                                  ? Colors.white
                                  : AppColors.primary,
                        ),
                        child: Text(
                          _cartController.cartList.length.toString(),
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class HomeHeaderController extends GetxController {
  static HomeHeaderController get instance => Get.find();

  final StorageUtils _storage = StorageUtils();

  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString role = ''.obs;
  final Rxn<Map<String, dynamic>> user = Rxn<Map<String, dynamic>>();
  final RxString userInitials = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final userData = _storage.readData("user_data");
      user.value = userData;

      if (userData != null && userData is Map<String, dynamic>) {
        name.value = userData["name"]?.toString() ?? '';
        email.value = userData["email"]?.toString() ?? '';
        role.value = userData["role"]?.toString() ?? '';

        // Gerar iniciais do usuário
        if (name.value.isNotEmpty) {
          final names = name.value.split(' ');
          userInitials.value =
              names.length > 1
                  ? '${names.first[0]}${names.last[0]}'.toUpperCase()
                  : name.value.substring(0, 2).toUpperCase();
        }
      }
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao carregar dados do usuário');
    }
  }
}
