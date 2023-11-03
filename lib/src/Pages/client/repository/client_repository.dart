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
          .where('id_user', isEqualTo: userID);

      final userCollectionReference = await userQuery.get();

      if (userCollectionReference.docs.isNotEmpty) {
        final userDoc = userCollectionReference.docs.first;

        final clientsCollectionReference =
            userDoc.reference.collection('clients');

        // Obtenha a referência para o documento do cliente que você deseja atualizar
        final clientDocReference = clientsCollectionReference
            .where('id_client', isEqualTo: clientToUpdate.idClient)
            .limit(1); // Certifique-se de limitar a 1, pois o ID deve ser único

        final querySnapshot = await clientDocReference.get();

        if (querySnapshot.docs.isNotEmpty) {
          // Recupere o documento do cliente encontrado
          final clientDoc = querySnapshot.docs.first;

          // Crie um novo mapa de dados com as atualizações que deseja aplicar
          final updatedData = clientToUpdate.toJson();

          // Atualize o documento do cliente
          await clientDoc.reference.update(updatedData);

          return ClientResult.success('Cliente atualizado com sucesso');
        } else {
          return ClientResult.error(
              'Nenhum cliente encontrado com o id_client especificado.');
        }
      } else {
        return ClientResult.error(
            'Nenhum usuário encontrado com o id_user especificado.');
      }
    } catch (e) {
      print('Erro ao atualizar o cliente: $e');
      return ClientResult.error('Erro na atualização: $e');
    }
  }

  Future<ClientResult> insertClient({
    required String userID,
    required ClientModel clientToUpdate,
  }) async {
    try {
      final userQuery = FirebaseFirestore.instance
          .collection('users')
          .where('id_user', isEqualTo: userID);

      final userCollectionReference = await userQuery.get();

      if (userCollectionReference.docs.isNotEmpty) {
        final userDoc = userCollectionReference.docs.first;

        // Crie um novo mapa de dados com as atualizações que deseja aplicar
        final updatedData = clientToUpdate.toJson();

        // adiciona novo cliente
        final clientsCollectionReference =
            userDoc.reference.collection('clients').add(updatedData);

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
