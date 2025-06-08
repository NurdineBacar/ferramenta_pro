import 'dart:convert';

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';

class EpiController extends GetxController {
  static EpiController get instance => Get.find();

  final RxList<dynamic> listEpis = [].obs;
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
      final resp = await HttpClient.get("epi");

      if (resp.statusCode != 200 && resp.statusCode != 201) {
        final error = jsonDecode(resp.body);
        throw error["message"] ?? "Erro ao buscar epis";
      }

      final epis = jsonDecode(resp.body);
      final List<dynamic> episData = epis["data"];

      // Convertendo cada item da lista para EpiModel
      listEpis.value =
          episData.map((epiJson) => EpiModel.fromJson(epiJson)).toList();

      isLoading.value = false;
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
      isLoading.value = false;
    }
  }

  Future<void> deleteEpi(String id) async {
    try {
      final resp = await HttpClient.delete("epi/${id}");

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Equipamanto deletado com suceso",
        );
        getEpis();
      } else {
        throw "Erro ao deletar equipamento";
      }
    } catch (e) {
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
      AppLoggerHelper.error(e.toString());
    }
  }
}
