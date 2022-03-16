import 'package:flutter/material.dart';
import 'package:laundry/repositories/auth_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('home called');
    final _auth = AuthRepository();
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          const Center(
            child: Text('home'),
          ),
        ],
      ),
    );
  }
}
