import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/logger.dart';

import '../auth/bloc/auth_bloc.dart';

final _logger = getLogger(HomeScreen);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        _logger.i(state);

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
                      Expanded(child: Text('HomeScreen screen...'))
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is LoggedOutState) {
          Navigator.pop(context);
          Navigator.pop(context);

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                title: const Text('HomeScreen'),
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
                child: Text('HomeScreen'),
              ),
            ],
          ),
        );
      },
    );
  }
}
