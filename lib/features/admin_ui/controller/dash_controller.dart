import 'package:get/get.dart';
import 'package:project/features/admin_ui/controller/epi_controller.dart';

class DashController extends GetxController {
  static DashController get instance => Get.find();

  final RxInt numEpis = 0.obs;
  final RxInt numClients = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    numEpis.value = Get.put(EpiController()).listEpis.length;
  }
}
