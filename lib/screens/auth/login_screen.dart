import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/screens/home/home_screen.dart';

import '../../logger.dart';
import '../../shared/widgets/custom_loading_widget.dart';
import '../../shared/widgets/input_widget.dart';
import '../../shared/widgets/my_button.dart';
import '../../utils/constants.dart';
import 'bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _logger = getLogger(LoginScreen);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        _logger.i(state);

        if (state is FailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        }
        if (state is LoggedInState) {
          // Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.green,
              content: Text(
                state.user.uid,
                textAlign: TextAlign.center,
              ),
            ),
          );
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
        if (state is LoadingState) {
          showCustomLoadingWidget(context);
        }
      },
      child: Scaffold(
        backgroundColor: Constants.primaryColor,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/washing_machine_illustration.png',
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Log in to your account',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Flexible(
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InputWidget(
                              topLabel: 'Email',
                              hintText: 'Enter your email address',
                              controller: _emailController,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            InputWidget(
                              topLabel: 'Password',
                              obscureText: false,
                              hintText: 'Enter your password',
                              controller: _passwordController,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MyButton(
                              type: ButtonType.primary,
                              text: 'Log In',
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                context.read<AuthBloc>().add(
                                      LoginEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
