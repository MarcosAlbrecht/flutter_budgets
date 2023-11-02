// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) => ClientModel(
      idClient: json['id_client'] as String?,
      idUser: json['id_user'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      createdAt: (json['created_at'] as Timestamp?)?.toDate(),
      updatedAt: (json['updated_at'] as Timestamp?)?.toDate(),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
      'id_client': instance.idClient,
      'id_user': instance.idUser,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'created_at': instance.createdAt != null
          ? Timestamp.fromDate(instance.createdAt!).toDate()
          : null,
      'updated_at': instance.updatedAt != null
          ? Timestamp.fromDate(instance.updatedAt!).toDate()
          : null,
      'active': instance.active,
    };
