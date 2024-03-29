import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/screens/auth/login_screen.dart';
import 'package:laundry/screens/auth/register_screen.dart';

import '../../shared/widgets/my_button.dart';
import '../../utils/constants.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const String routeName = '/authentication';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 150.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cloth_faded.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/illustration.png',
                        scale: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
              decoration: const BoxDecoration(
                color: Constants.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Laundry',
                    style: GoogleFonts.roboto(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Please log in or create an account below.',
                    style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 1),
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  MyButton(
                    text: 'Log In',
                    type: ButtonType.plain,
                    onPressed: () async {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  MyButton(
                    text: 'Create an Account',
                    type: ButtonType.primary,
                    onPressed: () =>
                        Navigator.pushNamed(context, RegisterScreen.routeName),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
