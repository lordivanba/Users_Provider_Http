import 'package:flutter/material.dart';
import 'package:users_b/dtos/responses/user_reponse_dto.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserResponseDto user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Card(
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  user.avatar,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Id: ${user.id}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.email,
                  style: const TextStyle(fontSize: 28),
                )
              ], //TODO: PENDING
            ),
          ),
        ),
      ),
    );
  }
}
