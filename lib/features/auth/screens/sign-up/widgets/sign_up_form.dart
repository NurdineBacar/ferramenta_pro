import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project/data/modal/user.dart';
import 'package:project/features/auth/controller/sign_up_controller.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _signUpController = Get.put(SignUpController());

  final RxBool showPassword1 = false.obs;
  final RxBool showPassword2 = false.obs;
  final RxBool passwordsMatch = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // First name and surname
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _signUpController.firstName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      prefixText: "| ",
                      labelText: "Primeiro Nome",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira seu primeiro nome';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _signUpController.lastName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      prefixText: "| ",
                      labelText: "Apelido",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira seu apelido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Email field
            TextFormField(
              controller: _signUpController.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.sms),
                labelText: "Email",
                prefixText: "| ",
                hintText: "Insira seu email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira seu email';
                }
                if (!value.isEmail) {
                  return 'Por favor insira um email válido';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Phone number field
            TextFormField(
              controller: _signUpController.phoneNumber,
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(9)],
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: "Telefone",
                prefixText: "| ",
                hintText: "Insira seu telefone",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira seu telefone';
                }
                if (value.length < 9) {
                  return 'O telefone deve ter 9 dígitos';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Password field
            Obx(
              () => TextFormField(
                controller: _signUpController.password,
                keyboardType: TextInputType.text,
                obscureText: !showPassword1.value,
                obscuringCharacter: "*",
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
                onChanged: (_) => _checkPasswordMatch(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.key),
                  suffixIcon: IconButton(
                    onPressed: () => showPassword1.toggle(),
                    icon: Icon(
                      showPassword1.value ? Iconsax.eye_slash : Iconsax.eye,
                    ),
                  ),
                  prefixText: "| ",
                  labelText: "Senha",
                  hintText: "Insira sua nova senha",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira sua senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),

            // Confirm password field
            Obx(
              () => TextFormField(
                controller: _signUpController.passwordConfirm,
                keyboardType: TextInputType.text,
                obscureText: !showPassword2.value,
                obscuringCharacter: "*",
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
                onChanged: (_) => _checkPasswordMatch(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => showPassword2.toggle(),
                    icon: Icon(
                      showPassword2.value ? Iconsax.eye_slash : Iconsax.eye,
                    ),
                  ),
                  prefixText: "| ",
                  labelText: "Confirmar senha",
                  hintText: "Confirma sua nova senha",
                  errorText:
                      passwordsMatch.value ? null : 'As senhas não coincidem',
                ),
              ),
            ),

            SizedBox(height: 40),

            // Sign up button
            Obx(
              () => SizedBox(
                width: Helpers.screenWidth(context),
                child: ElevatedButton(
                  onPressed:
                      passwordsMatch.value && _signUpController.isFormValid()
                          ? _handleSignUp
                          : null,
                  child:
                      _signUpController.isLoading.value
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Criar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkPasswordMatch() {
    final match =
        _signUpController.password.text.isNotEmpty &&
        _signUpController.password.text ==
            _signUpController.passwordConfirm.text;
    passwordsMatch.value = match;
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final user = UserModel(
        name:
            '${_signUpController.firstName.text.trim()} ${_signUpController.lastName.text.trim()}',
        email: _signUpController.email.text.trim(),
        phoneNumber: _signUpController.phoneNumber.text.trim(),
        password: _signUpController.password.text.trim(),
      );

      await _signUpController.signUp(user);
    } else {
      Helpers.warnigSnackbar(
        title: 'Campos inválidos',
        message: 'Por favor preencha todos os campos corretamente',
      );
    }
  }
}
