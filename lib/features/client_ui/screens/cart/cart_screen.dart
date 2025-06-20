import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/data/modal/cart_model.dart';
import 'package:project/data/modal/reservation_model.dart';
import 'package:project/features/client_ui/controller/my_cart_controller.dart';
import 'package:project/features/client_ui/model/cart_item_model.dart';
import 'package:project/common/widgets/home_header.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/image.dart';
import 'package:project/utils/device/device_utility.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _cartCOntroller = Get.put(MyCartController());
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
            child: Obx(
              () => ListView.builder(
                itemCount: _cartCOntroller.cartList.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final CartModel cartItem = _cartCOntroller.cartList[index];

                  return Column(
                    children: [CartItem(item: cartItem), SizedBox(height: 15)],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Total:", style: Theme.of(context).textTheme.titleMedium),
              Obx(
                () => Text(
                  "${_cartCOntroller.total} MT",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),

          // Botoes
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _cartCOntroller.cancel(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Cancelar"),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _handleReservation(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Reservar"),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Future<void> _handleReservation() async {
    await _cartCOntroller.makeReservation();
  }
}

class CartItem extends StatelessWidget {
  final CartModel item;

  const CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
                  item.epi.images.isNotEmpty
                      ? Image.asset(item.epi.images[0], fit: BoxFit.cover)
                      : Image.asset(AppImage.noImage, fit: BoxFit.cover),
            ),
          ),
          // Datas
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.epi.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text.rich(
                TextSpan(
                  text: "Periodo: ",
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [TextSpan(text: "${item.days}")],
                ),
              ),
              SizedBox(height: 14),
              Text.rich(
                TextSpan(
                  text: "Total: ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: "${item.total} MT",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Button
          IconButton(
            onPressed:
                () => Get.put(MyCartController.instance).remove(item.index),
            icon: Icon(Iconsax.close_circle, size: 32, color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
