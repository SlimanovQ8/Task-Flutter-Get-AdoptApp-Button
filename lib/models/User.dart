import 'package:json_annotation/json_annotation.dart';

part "User.g.dart";
@JsonSerializable()

class User {
  int? id;
  String UserName;
  String password;

  User ({ required this.UserName, required this.password});


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}