import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/logger.dart';
import 'package:laundry/screens/auth/authentication_screen.dart';
import 'package:laundry/screens/home/home_screen.dart';

import '../utils/constants.dart';
import 'auth/bloc/auth_bloc.dart';

final _logger = getLogger(SplashScreen);

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.primaryColor,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          _logger.i(state);
          if (state is LoggedInState) {
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
          if (state is LoggedOutState) {
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pushNamed(context, AuthenticationScreen.routeName);
          }
        },
        listenWhen: (previous, current) {
          return true;
        },
        child: const Center(
          child: Text('Laundry'),
        ),
      ),
    );
  }
}
