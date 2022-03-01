import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final AuthService _auth;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _auth = AuthService();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _loginFormKey,
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
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            if (_loginFormKey.currentState!.validate()) {
              // var response = _auth.LoginWithEmailAndPassword(
              //   _emailController.text,
              //   _passwordController.text,
              // );

              // debugPrint(response.toString());
            }
          },
        ),
      ),
    );
  }
}
