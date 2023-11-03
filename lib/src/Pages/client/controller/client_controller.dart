import 'package:app_orcamento/src/Pages/client/repository/client_repository.dart';
import 'package:app_orcamento/src/Pages/list_clients/controller/clients_controller.dart';
import 'package:app_orcamento/src/models/client_model.dart';
import 'package:app_orcamento/src/utils/utils_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ClientController extends GetxController {
  final clientRepository = ClientRepository();

  final clientsController = Get.find<ClientsController>();

  ClientModel clientModel = ClientModel();

  RxBool isInserting = false.obs;
  RxBool isEditing = false.obs;
  RxBool isSaving = false.obs;

  final _uuid = Uuid();
  final UtilServices utilServices = UtilServices();

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments as Map<String, dynamic>;

    final String mode = arguments['mode'];
    switch (mode) {
      case "view":
        clientModel = arguments['client'];
        break;
      case "edit":
        clientModel = arguments['client'];
        isEditing = true.obs;
        break;
      case "insert":
        clientModel = ClientModel();
        isInserting = true.obs;
        break;
      default:
    }
  }

  void setSaving(bool value) {
    isSaving.value = value;
    update();
  }

  Future<void> handleSaveClient() async {
    setSaving(true);

    if (isEditing.value) {
      clientModel.updatedAt = DateTime.now();
      final result = await clientRepository.updateClient(
          userID: clientModel.idClient!, clientToUpdate: clientModel);
      result.when(
        success: (data) {
          clientsController.update();
          utilServices.showToast(message: "Cliente salvo com sucesso!");
        },
        error: (message) {
          utilServices.showToast(
              message: "Ocorreu um erro ao salvar!", isError: true);
        },
      );
    }

    setSaving(false);
  }
}
