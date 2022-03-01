import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cloth_faded.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/illustration.png',
                      scale: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                decoration: const BoxDecoration(
                  color: Constants.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 20.0),
                    Text(
                      'Welcome to Laundree!',
                    ),

                    Text(
                      'This is the first version of our laundry app. Please sign in or create an account below.',
                      style: TextStyle(
                        color: Color.fromRGBO(74, 77, 84, 1),
                        fontSize: 14.0,
                      ),
                    ),

                    // Let's create a generic button widget

                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
