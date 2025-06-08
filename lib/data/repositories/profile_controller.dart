import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/data/modal/user.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/local_storage/local_storage.dart';
import 'package:project/utils/logging/logger.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  StorageUtils _storageUtils = StorageUtils();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();

  Future<void> updateProfile() async {
    try {
      final resp = await HttpClient.put(
        "user/edit-profile/${_storageUtils.dadosUser()['id']}",
        {
          "name": firstName.text + " " + lastName.text,
          "email": email.text,
          "phone_number": phoneNumber.text,
        },
      );

      Helpers.warnigSnackbar(title: resp.body);

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final decode = jsonDecode(resp.body);
        _storageUtils.removedata("user_data");
        _storageUtils.saveData("user_data", decode["data"]);

        Get.back();
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Sucesso ao atualizar perfil",
        );
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }
}
