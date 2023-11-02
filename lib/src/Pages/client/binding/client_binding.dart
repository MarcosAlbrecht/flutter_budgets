import 'package:app_orcamento/src/Pages/client/controller/client_controller.dart';
import 'package:get/get.dart';

class ClientBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientController());
  }
}
