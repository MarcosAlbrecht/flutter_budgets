// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

//converter timestamp do firebase para datetime do dart
// createdAt: (json['created_at'] as Timestamp?)?.toDate(),
// updatedAt: (json['updated_at'] as Timestamp?)?.toDate(),

//converter datetime do dart para timestamp do firebase
// 'created_at': instance.createdAt != null
//           ? Timestamp.fromDate(instance.createdAt!).toDate()
//           : null,
//       'updated_at': instance.updatedAt != null
//           ? Timestamp.fromDate(instance.updatedAt!).toDate()
//           : null,

@JsonSerializable()
class ClientModel {
  @JsonKey(name: 'id_client')
  String? idClient;
  @JsonKey(name: 'id_user')
  String? idUser;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'active')
  bool? active;
  ClientModel({
    this.idClient,
    this.idUser,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.active,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

  @override
  String toString() {
    return 'ClientModel(idClient: $idClient, idUser: $idUser, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, active: $active)';
  }
}
