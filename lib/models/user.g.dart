// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      usrId: (json['usrId'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      usrName: json['usrName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'usrId': instance.usrId,
      'fullName': instance.fullName,
      'email': instance.email,
      'usrName': instance.usrName,
      'password': instance.password,
    };
