import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';

class UserCreateScreen extends StatelessWidget {
  const UserCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final jobController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User create screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  label: Text('Job'),
                  border: OutlineInputBorder(),
                ),
                controller: jobController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un trabajo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.maxFinite, 50),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<UsersProvider>().createUser(
                        nameController.text, jobController.text, context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
