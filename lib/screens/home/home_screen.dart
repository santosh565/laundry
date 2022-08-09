import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/logger.dart';
import 'package:laundry/shared/widgets/custom_loading_widget.dart';

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
          showCustomLoadingWidget(context);
        }
        if (state is LoggedOutState) {
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
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
