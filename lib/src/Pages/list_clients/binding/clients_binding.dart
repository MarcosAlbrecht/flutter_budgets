import 'package:get/get.dart';

import '../controller/clients_controller.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientsController());
  }
}
