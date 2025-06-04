import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/courossel_item.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class DetailsEquipamentScreen extends StatelessWidget {
  DetailsEquipamentScreen({super.key});

  final Rx<int> currentImage = 0.obs;

  final Rx<int> days = 1.obs;

  Equipament get _equipamebt {
    final args = Get.arguments;
    if (args != null && args.containsKey('equipament')) {
      return args["equipament"] as Equipament;
    }

    throw Exception('Equipamento não encontrada nos argumentos');
  }

  late Rx<double> _total = _equipamebt.pricePerDay.obs;

  void getTotal() {
    _total.value = _equipamebt.pricePerDay * days.value;
  }

  @override
  Widget build(BuildContext context) {
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
                    CourosselItem(),

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
                                    _equipamebt.name,
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

                              IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.heart, size: 30),
                              ),
                            ],
                          ),

                          SizedBox(height: 15),

                          Text(
                            _equipamebt.description,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.justify,
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
                      onPressed: () {},
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
}
