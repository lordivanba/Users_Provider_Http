import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_b/providers/users_provider.dart';
import 'package:users_b/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider()..fetchUsers(),
      child: const MaterialApp(
        title: 'Material App',
        home: HomeScreen(),
      ),
    );
  }
}
