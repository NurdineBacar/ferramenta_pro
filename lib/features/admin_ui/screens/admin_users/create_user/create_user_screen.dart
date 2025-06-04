import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/constants/sizes.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Novo Utilizador"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.appBarAuthHeigth),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 70),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: "Primeiro nome",
                    prefixText: "| ",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: "Apelido",
                    prefixText: "| ",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.sms),
              labelText: "Email",
              prefixText: "| ",
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.call),
              labelText: "Telefone",
              prefixText: "| ",
            ),
          ),

          SizedBox(height: 75),
          SizedBox(
            width: Helpers.screenWidth(context),
            child: ElevatedButton(onPressed: () {}, child: Text("Criar")),
          ),
        ],
      ),
    );
  }
}
