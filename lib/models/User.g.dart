// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      UserName: json['UserName'] as String,
      password: json['password'] as String,
    )..id = json['id'] as int?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'UserName': instance.UserName,
      'password': instance.password,
    };
