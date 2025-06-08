import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/courossel_item.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/data/modal/cart_model.dart';
import 'package:project/features/client_ui/controller/client_epis_controller.dart';
import 'package:project/features/client_ui/controller/fav_controller.dart';
import 'package:project/features/client_ui/controller/my_cart_controller.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class DetailsEquipamentScreen extends StatelessWidget {
  DetailsEquipamentScreen({super.key});

  final Rx<int> days = 1.obs;

  EpiModel get _equipamebt {
    final args = Get.arguments;
    if (args != null && args.containsKey('equipament')) {
      return args["equipament"] as EpiModel;
    }

    throw Exception('Equipamento não encontrada nos argumentos');
  }

  late Rx<double> _total = _equipamebt.pricePerDay.obs;
  final _cartController = Get.put(MyCartController());
  final _epiController = Get.put(ClientEpisController.instance);
  final _favController = Get.put(FavController());

  void getTotal() {
    _total.value = _equipamebt.pricePerDay * days.value;
  }

  @override
  Widget build(BuildContext context) {
    _epiController.getEpiDatas(id: _equipamebt.id!);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Detalhes"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CourosselItem(images: _equipamebt.images),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _equipamebt.title,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    "Periodo: ${_equipamebt.minDays} - ${_equipamebt.maxDays} dias",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),

                              Obx(() {
                                final epi = _epiController.epiData.value;
                                final isFav = epi?.userId != null;

                                return IconButton(
                                  onPressed: () {
                                    if (epi == null)
                                      return; // Não faz nada se não carregou ainda

                                    if (!isFav) {
                                      if (_equipamebt.id != null) {
                                        _favController.addFav(
                                          id: _equipamebt.id!,
                                        );
                                      }
                                    } else {
                                      if (_equipamebt.id != null) {
                                        _favController.removeFav(
                                          id: _equipamebt.id!,
                                        );
                                      }
                                    }
                                  },
                                  icon:
                                      isFav
                                          ? Icon(
                                            Iconsax.heart5,
                                            size: 30,
                                            color: AppColors.primary,
                                          )
                                          : Icon(Iconsax.heart, size: 30),
                                );
                              }),
                            ],
                          ),

                          SizedBox(height: 15),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _equipamebt.description.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(height: 20),

                          // PReco por dia
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: "Por dia: ",
                                style: Theme.of(context).textTheme.titleMedium,
                                children: [
                                  TextSpan(
                                    text: "${_equipamebt.pricePerDay} MT",
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          // Input para adionar quantidade
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => SizedBox(
                                  width: 55,
                                  child: FilledButton(
                                    onPressed:
                                        days.value == 1
                                            ? null
                                            : () {
                                              days.value--;
                                              getTotal();
                                            },
                                    child: Icon(Iconsax.minus, size: 28),
                                  ),
                                ),
                              ),

                              SizedBox(width: 7),

                              Obx(
                                () => SizedBox(
                                  width: 55,
                                  height: 48,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    controller: TextEditingController(
                                      text: "${days.value}",
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        bottom: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 7),
                              SizedBox(
                                width: 55,
                                child: FilledButton(
                                  onPressed: () {
                                    days.value++;
                                    getTotal();
                                  },
                                  child: Icon(Iconsax.add, size: 28),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total:",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Obx(
                        () => Text(
                          "${_total.value} MT",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: Helpers.screenWidth(context) * 0.5,
                    child: ElevatedButton(
                      onPressed: () => _handleAddCart(),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text("Adicionar ao carrinho"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAddCart() async {
    CartModel item = CartModel(
      index: _cartController.cartList.length,
      epi: _equipamebt,
      days: days.value,
      total: _total.value,
    );
    _cartController.addToCart(item);
  }
}
