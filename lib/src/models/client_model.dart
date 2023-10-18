// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
class ClientModel {
  String? id;
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
    this.id,
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
    return 'ClientModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, active: $active)';
  }
}
