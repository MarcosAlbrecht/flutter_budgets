import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/client_model.dart';
import '../result/client_result.dart';

class ClientRepository {
  late CollectionReference collectionReference;

  Future<ClientResult> updateClient({
    required String userID,
    required ClientModel clientToUpdate,
  }) async {
    try {
      final userQuery = FirebaseFirestore.instance
          .collection('users')
          .where('id_user', isEqualTo: 'pU5C8w4JXxMKGdN7Gy2U');

      final userCollectionReference = await userQuery.get();

      if (userCollectionReference.docs.isNotEmpty) {
        final userDoc = userCollectionReference.docs.first;

        final clientsCollectionReference =
            userDoc.reference.collection('clients');

        final clientIDToUpdate = clientToUpdate.idClient;

        // Obtenha a referência para o documento do cliente que você deseja atualizar
        final clientDocReference =
            clientsCollectionReference.doc(clientIDToUpdate);

        // Crie um novo mapa de dados com as atualizações que deseja aplicar
        final updatedData = clientToUpdate.toJson();

        // Atualize o documento do cliente
        await clientDocReference.update(updatedData);

        return ClientResult.success('Cliente atualizado com sucesso');
      } else {
        return ClientResult.error(
            'Nenhum usuário encontrado com o id_user especificado.');
      }
    } catch (e) {
      print('Erro ao atualizar o cliente: $e');
      return ClientResult.error('Erro na atualização: $e');
    }
  }
}
