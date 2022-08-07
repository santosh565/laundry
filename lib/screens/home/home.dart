import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint('Home: $state');

        if (state is LoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(13),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(41, 222, 146, 1),
                        color: Colors.white,
                      ),
                      SizedBox(width: 26),
                      Expanded(child: Text('home screen...'))
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is LoggedOutState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                title: const Text('Home'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      context.read<AuthBloc>().add(
                            const LogoutEvent(),
                          );
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
      },
    );
  }
}
