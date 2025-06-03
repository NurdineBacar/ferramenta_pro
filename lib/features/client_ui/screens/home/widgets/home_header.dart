import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/features/client_ui/controller/navigationController.dart';
import 'package:project/features/client_ui/screens/cart/cart_screen.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/device/device_utility.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});

  final controller = Get.put(NavigationController());

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
                "M",
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
                  "Marcel Nota",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),

        SizedBox(
          width: 50, // largura maior que o container do ícone
          height: 50, // altura maior que o container do ícone
          child: Stack(
            clipBehavior: Clip.none, // permite que o badge fique fora do Stack
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
              Positioned(
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
                    "12",
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
