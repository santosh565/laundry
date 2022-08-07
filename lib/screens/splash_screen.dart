import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/screens/auth/authentication_screen.dart';

import '../routes.dart';
import '../utils/constants.dart';
import 'auth/bloc/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.primaryColor,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          debugPrint('SplashScreen listener: $state');
          if (state is LoggedInState) {
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pushNamed(context, RouteName.homeScreen);
          }
          if (state is LoggedOutState) {
            await Future.delayed(const Duration(seconds: 3));
            Navigator.pushNamed(context, AuthenticationScreen.routeName);
          }
        },
        child: const Center(
          child: Text('Laundry'),
        ),
      ),
    );
  }
}
