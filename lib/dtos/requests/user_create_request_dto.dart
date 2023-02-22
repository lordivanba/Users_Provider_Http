// To parse this JSON data, do
//
//     final userCreateRequestDto = userCreateRequestDtoFromJson(jsonString);

import 'dart:convert';

UserCreateRequestDto userCreateRequestDtoFromJson(String str) =>
    UserCreateRequestDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(UserCreateRequestDto data) =>
    json.encode(data.toJson());

class UserCreateRequestDto {
  UserCreateRequestDto({
    required this.name,
    required this.job,
  });

  final String name;
  final String job;

  factory UserCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      UserCreateRequestDto(
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
