import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/client_model.dart';
import '../result/clients_result.dart';

class UsersRepository {
  late CollectionReference collectionReference;

  Future<ClientsResult<ClientModel>> getAllClientsByUserID({
    required String userID,
  }) async {
    try {
      final collectionReference = FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('clients');
      final querySnapshot = await collectionReference.get();
      if (querySnapshot.docs.isNotEmpty) {
        final clients = querySnapshot.docs
            .map(
              (doc) => ClientModel.fromJson(doc.data() as Map<String, dynamic>),
            )
            .toList();
        return ClientsResult<ClientModel>.success(clients);
      } else {
        return ClientsResult<ClientModel>.error('Nenhum cliente encontrado.');
      }
    } catch (e) {
      print('Erro ao consultar a coleção: $e');
      return ClientsResult<ClientModel>.error('Erro na consulta: $e');
    }
  }
}
