import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:users_b/dtos/requests/user_create_request_dto.dart';
import 'package:users_b/dtos/responses/user_reponse_dto.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  final logger = Logger();

  List<UserResponseDto>? _users;

  bool isLoading = true;

  List<UserResponseDto>? get users => _users;

  Future fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      // CUANDO TODO SALE BIEN 200
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['data'];

      _users = data.map((user) => UserResponseDto.fromJson(user)).toList();

      isLoading = false;

      notifyListeners(); // Notificar cambios
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future createUser(String name, String job, BuildContext context) async {
    final user = UserCreateRequestDto(name: name, job: job);

    final response = await http.post(
      Uri.parse('https://reqres.in/api/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 201) {
      logger.d('User created: ${response.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created!')),
        );
        Navigator.pop(context);
      }
    } else {
      logger.e('Error: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}!')),
        );
      }
    }
  }
}
