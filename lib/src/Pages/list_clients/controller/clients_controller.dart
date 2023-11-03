import 'package:get/get.dart';

import '../../../models/client_model.dart';
import '../repository/clients_repository.dart';

class ClientsController extends GetxController {
  final usersRepository = UsersRepository();

  List<ClientModel> allClients = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    final result = await usersRepository.getAllClientsByUserID(
        userID: "pU5C8w4JXxMKGdN7Gy2U");
    result.when(
      success: (data) {
        allClients = data;
        print(allClients);
      },
      error: (message) {},
    );
  }

  void updateList(ClientModel client) {
    update();
  }

  void updateListNewClient(ClientModel client) {
    List<ClientModel> clients = [];
    clients.addAll(allClients);
    clients.add(client);
    allClients = clients;

    update();
  }
}
