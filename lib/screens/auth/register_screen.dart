import 'package:flutter/material.dart';

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
        actions: const <Widget>[],
      ),
      body: Container(
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
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          child: const Text('Register'),
          onPressed: () {
            if (_registerFormKey.currentState!.validate()) {// var response = _auth.register(
              //   email: _emailController.text,
              //   password: _passwordController.text,
              // );

            }
          },
        ),
      ),
    );
  }
}
