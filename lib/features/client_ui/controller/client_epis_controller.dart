import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';

class ClientEpisController extends GetxController {
  static ClientEpisController get instance => Get.find();

  final RxList<dynamic> epiList = [].obs;
  final RxList<dynamic> epiListCategorie = [].obs;
  final Rxn<EpiModel> epiData = Rxn<EpiModel>();

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEpis();
  }

  Future<void> getEpis() async {
    try {
      isLoading.value = true;
      final resp = await HttpClient.get('epi');

      if (resp.statusCode == 200 || resp.statusCode == 200) {
        final decode = jsonDecode(resp.body);
        final List<dynamic> epis = decode["data"];

        epiList.value = epis.map((t) => EpiModel.fromJson(t)).toList();
        isLoading.value = false;
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }

  Future<void> getEpiDatas({required String id}) async {
    try {
      final resp = await HttpClient.get('epi/$id');

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final decode = jsonDecode(resp.body);
        epiData.value = EpiModel.fromJson(decode["data"]);
      }
    } catch (e) {
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
      AppLoggerHelper.error(e.toString());
    }
  }

  void filterByCategorie(String? categorie) {
    if (categorie == null || categorie.isEmpty) {
      epiListCategorie.value = List.from(epiList.value);
      return;
    }

    epiListCategorie.value =
        epiList.value
            .where(
              (epi) => epi.category?.toLowerCase() == categorie.toLowerCase(),
            )
            .toList();
  }
}
