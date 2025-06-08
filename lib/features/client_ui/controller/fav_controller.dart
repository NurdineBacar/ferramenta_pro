import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/local_storage/local_storage.dart';
import 'package:project/utils/logging/logger.dart';

class FavController extends GetxController {
  static FavController get instance => Get.find();

  final StorageUtils _storageUtils = StorageUtils();
  final RxList favList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavs();
  }

  Future<void> getFavs() async {
    try {
      final resp = await HttpClient.get(
        "fav/list/${_storageUtils.dadosUser()['id']}",
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        final decode = jsonDecode(resp.body);
        final List<dynamic> list = decode["data"];

        favList.value = list.map((t) => EpiModel.fromJson(t)).toList();
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }

  Future<void> addFav({required String id}) async {
    try {
      final resp = await HttpClient.post("fav/add", {
        "userId": _storageUtils.dadosUser()['id'],
        "epiId": id,
      });

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        getFavs();
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Adicionado com sucesso aos favoritos",
        );
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }

  Future<void> removeFav({required String id}) async {
    try {
      final resp = await HttpClient.delete(
        "fav/remove/${_storageUtils.dadosUser()['id']}/$id",
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        getFavs();
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Desfavoritado com sucesso",
        );
      }
    } catch (e) {
      AppLoggerHelper.error(e.toString());
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
    }
  }
}
