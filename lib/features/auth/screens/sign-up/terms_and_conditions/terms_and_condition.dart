import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/common/widgets/bullet_text.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/constants/text_string.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen({super.key});

  final RxBool agreeTerms = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.appBarAuthHeigth),

              // Título fixo
              Center(
                child: Text(
                  AppTextConst.termsTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              SizedBox(height: 45),

              // Lista de termos com scroll
              Expanded(
                child: ListView.builder(
                  itemCount: AppTextConst.listOfTerms.length,
                  itemBuilder: (context, index) {
                    final term = AppTextConst.listOfTerms[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BulletText(text: term.title),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 4),
                            child: Text(term.descrition),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: agreeTerms.value,
                      onChanged: (value) {
                        agreeTerms.value = value!;
                      },
                    ),
                  ),
                  Text(AppTextConst.acceptTerms),
                ],
              ),
              SizedBox(height: 7),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Cancelar"),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: agreeTerms.value ? () {} : null,

                        child: Text("Concluir"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
