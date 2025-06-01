import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First name and surname
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    prefixText: "| ",
                    labelText: "Primeiro Nome",
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    prefixText: "| ",
                    labelText: "Apelido",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sms),
              labelText: "Email",
              prefixText: "| ",
              hintText: "Insira seu email",
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: "Telefone",
              prefixText: "| ",
              hintText: "Insira seu telefone",
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            inputFormatters: [LengthLimitingTextInputFormatter(8)],
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.key),
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Iconsax.eye)),
              prefixText: "| ",
              labelText: "Senha",
              hintText: "Insira sua nova senha",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            inputFormatters: [LengthLimitingTextInputFormatter(8)],
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Iconsax.eye)),
              prefixText: "| ",
              labelText: "Confirmar senha",
              hintText: "Confirma sua nova senha",
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
