import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/client_model.dart';
import '../result/clients_result.dart';

class UsersRepository {
  late CollectionReference userCollectionReference;

  Future<ClientsResult<ClientModel>> getAllClientsByUserID({
    required String userID,
  }) async {
    try {
      final userQuery = FirebaseFirestore.instance
          .collection('users')
          .where('id_user', isEqualTo: 'pU5C8w4JXxMKGdN7Gy2U');

      final userCollectionReference =
          await userQuery.get(); // Execute a consulta

      if (userCollectionReference.docs.isNotEmpty) {
        // Obtenha o documento de usuário encontrado
        final userDoc = userCollectionReference.docs.first;

        // Em seguida, acesse a subcoleção "clients" no documento de usuário
        final clientsCollectionReference =
            userDoc.reference.collection('clients');

        final querySnapshot = await clientsCollectionReference
            .get(); // Realize a consulta dentro da subcoleção "clients"

        if (querySnapshot.docs.isNotEmpty) {
          final clients = querySnapshot.docs
              .map(
                (doc) =>
                    ClientModel.fromJson(doc.data() as Map<String, dynamic>),
              )
              .toList();
          return ClientsResult<ClientModel>.success(clients);
        } else {
          return ClientsResult<ClientModel>.error('Nenhum cliente encontrado.');
        }
      } else {
        return ClientsResult<ClientModel>.error(
            'Nenhum usuário encontrado com o id_user especificado.');
      }
    } catch (e) {
      print('Erro ao consultar a coleção: $e');
      return ClientsResult<ClientModel>.error('Erro na consulta: $e');
    }
  }
}
