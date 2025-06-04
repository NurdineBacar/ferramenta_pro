import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/courossel_item.dart';
import 'package:project/features/client_ui/model/equipament.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

// ignore: must_be_immutable
class AdminDetailsBookerScreen extends StatelessWidget {
  AdminDetailsBookerScreen({super.key});

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
          onPressed: () => Get.back(),
          icon: Icon(Iconsax.arrow_left),
        ),
      ),
      body: Column(
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
                                  style: Theme.of(context).textTheme.titleSmall,
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
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),

                        SizedBox(
                          height: 235,
                          child: GridView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.5,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                ),
                            children: [
                              LabelValue(
                                label: "Periodo reservado",
                                value: "4 dias",
                              ),
                              LabelValue(
                                label: "Tempo restante",
                                value: "2 dias",
                              ),
                              LabelValue(
                                label: "Cliente",
                                value: "Marcel Nota",
                              ),
                              LabelValue(
                                label: "Telefone",
                                value: "85 123 4567",
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Estado",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                    ),

                                    SizedBox(height: 8),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.primary,
                                      ),
                                      child: Text(
                                        "Em uso",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                    child: Text("Concluir levantamento"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class LabelValue extends StatelessWidget {
  final String label, value;
  const LabelValue({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 6),
        Text(value, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
