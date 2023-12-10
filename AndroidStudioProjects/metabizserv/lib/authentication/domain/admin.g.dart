// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminImpl _$$AdminImplFromJson(Map<String, dynamic> json) => _$AdminImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      isSuperAdmin: json['isSuperAdmin'] as bool,
      createdOn:
          const TimestampConverter().fromJson(json['createdOn'] as Timestamp),
    );

Map<String, dynamic> _$$AdminImplToJson(_$AdminImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'isSuperAdmin': instance.isSuperAdmin,
      'createdOn': const TimestampConverter().toJson(instance.createdOn),
    };
