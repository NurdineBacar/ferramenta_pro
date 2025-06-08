import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/data/modal/cart_model.dart';
import 'package:project/data/modal/reservation_model.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/local_storage/local_storage.dart';
import 'package:project/utils/logging/logger.dart';

class MyCartController extends GetxController {
  static MyCartController get instance => Get.find();

  final RxList<CartModel> cartList = <CartModel>[].obs;
  final RxDouble total = 0.0.obs;
  final StorageUtils _storage = StorageUtils();

  Future<void> makeReservation() async {
    try {
      for (var item in cartList) {
        final resp = await HttpClient.post("reservation", {
          "reservedDays": item.days,
          "remainDays": item.days,
          "numEpis": 1,
          "total": item.total,
          "status": "pendente",
          "epiid": item.epi.id,
          "userId": _storage.dadosUser()["id"],
        });

        if (resp.statusCode == 200 || resp.statusCode == 201) {
          Helpers.successSnackbar(
            title: "Sucesso",
            message: "Reservado com sucesso ${item.epi.title}",
          );
        } else {
          final error = jsonDecode(resp.body);
          throw error["message"] ?? "Falha ao realizar a reserva";
        }
      }

      cancel();
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }

  void addToCart(CartModel cart) {
    cartList.add(cart); // Use .add do RxList, não .value.add
    getTotal();

    Helpers.successSnackbar(
      title: "Sucesso",
      message: "Adicionado com sucesso",
    );

    Future.delayed(Duration(seconds: 1), () {
      Get.back();
    });
  }

  void remove(int index) {
    cartList.removeAt(index); // Use .removeAt do RxList
    getTotal();
    Helpers.successSnackbar(title: "Sucesso", message: "Removido com sucesso");
  }

  void getTotal() {
    double sum = 0.0;
    for (var item in cartList) {
      sum += item.total;
    }
    total.value = sum;
  }

  void cancel() {
    cartList.clear();
  }
}
