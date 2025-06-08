import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/data/modal/reservation_model.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/local_storage/local_storage.dart';
import 'package:project/utils/logging/logger.dart';

class ReservationController extends GetxController {
  static ReservationController get instance => Get.find();
  final isLoading = false.obs;

  final RxList<dynamic> reservationList = [].obs;
  StorageUtils _storage = StorageUtils();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getReservation();
  }

  Future<void> getReservation() async {
    try {
      isLoading.value = true;
      final resp = await HttpClient.get("reservation");
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final decode = jsonDecode(resp.body);
        final List<dynamic> list = decode["data"];
        reservationList.value =
            list.map((t) => ReservationModel.fromJson(t)).toList();
      }
      isLoading.value = false;
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }
}
