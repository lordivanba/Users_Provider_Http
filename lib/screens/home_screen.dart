import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_b/providers/users_provider.dart';
import 'package:users_b/screens/user_create_screen.dart';
import 'package:users_b/screens/user_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usersProvider = context.read<UsersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UsersProvider>(
            builder: (context, usersProvider, child) => usersProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: usersProvider.users?.length,
                      itemBuilder: (context, index) {
                        final user = usersProvider.users![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Card(
                            color: Colors.blue[100],
                            child: ListTile(
                              splashColor: Colors.red,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetailsScreen(user: user),
                                  ),
                                );
                              },
                              title: Text("${user.firstName} ${user.lastName}"),
                              subtitle: Text(user.email),
                              leading: Image.network(user.avatar),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserCreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
