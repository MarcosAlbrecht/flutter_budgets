// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) => ClientModel(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : (json['created_at'] as Timestamp?)?.toDate(),
      updatedAt: json['updated_at'] == null
          ? null
          : (json['updated_at'] as Timestamp?)?.toDate(),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'active': instance.active,
    };
