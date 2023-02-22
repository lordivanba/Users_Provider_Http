// To parse this JSON data, do
//
//     final userResponseDto = userResponseDtoFromJson(jsonString);

import 'dart:convert';

UserResponseDto userResponseDtoFromJson(String str) =>
    UserResponseDto.fromJson(json.decode(str));

String userResponseDtoToJson(UserResponseDto data) =>
    json.encode(data.toJson());

class UserResponseDto {
  UserResponseDto({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) =>
      UserResponseDto(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
