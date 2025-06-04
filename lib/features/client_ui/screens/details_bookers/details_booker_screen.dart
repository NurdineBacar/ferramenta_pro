import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/common/widgets/courossel_item.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class DetailsBookerScreen extends StatelessWidget {
  DetailsBookerScreen({super.key});

  final Rx<int> currentImage = 0.obs;

  final Rx<int> days = 1.obs;

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
                                    "Parafuso chave estrela",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    "Periodo: 5 - 7 dias",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  Text(
                                    "Tempo remanescente: 7 dias",
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
                            "Fabricado em aço carbono/zincado (ou inox), oferece excelente resistência mecânica e durabilidade. Seu encaixe reduz o risco de espanar e proporciona melhor transmissão de força durante o aperto.",
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
                                    text: "100.0 MT",
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
                          Container(
                            width: Helpers.screenWidth(context),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Text(
                              "Observação: Em caso de atraso na devolução, será cobrada uma penalização de 40,00 MT por dia. Em caso de dano ao equipamento, será aplicada uma multa conforme avaliação da equipe da ferragem.",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
