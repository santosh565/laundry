import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes.dart';
import '../../services/auth.dart';
import '../../utils/constants.dart';
import '../widgets/my_button.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _service = AuthService();

  @override
  initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

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
                      var response = await _service.signInAnon();
                      debugPrint(response.toString());
                      // Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  MyButton(
                    text: 'Create an Account',
                    type: ButtonType.primary,
                    onPressed: () =>
                        Navigator.pushNamed(context, RouteName.registerScreen),
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
