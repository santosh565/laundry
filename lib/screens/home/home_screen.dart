import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/logger.dart';
import 'package:laundry/screens/auth/authentication_screen.dart';
import 'package:laundry/shared/widgets/custom_loading_widget.dart';

import '../auth/bloc/auth_bloc.dart';

final _logger = getLogger(HomeScreen);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    _logger.i('build called');

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingState) {
          _logger.i(state);

          showCustomLoadingWidget(context);
        }
        if (state is LoggedOutState) {
          _logger.i(state);

          Navigator.pushReplacementNamed(
            context,
            AuthenticationScreen.routeName,
          );
          // Navigator.pop(context);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor: Colors.red,
          //     content: Text(state.error),
          //   ),
          // );
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
