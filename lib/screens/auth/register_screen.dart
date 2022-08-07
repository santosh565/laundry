import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/screens/auth/bloc/auth_bloc.dart';

import '../../shared/widgets/custom_loading_widget.dart';
import '../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _registerFormKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreen'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is FailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
          if (state is LoggedInState) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
          if (state is LoadingState) {
            showCustomLoadingWidget(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _registerFormKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          child: const Text('Register'),
          onPressed: () {
            context.read<AuthBloc>().add(
                  RegisterEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
          },
        ),
      ),
    );
  }
}
