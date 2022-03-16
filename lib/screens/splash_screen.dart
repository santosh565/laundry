import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Material(
      color: Constants.primaryColor,
      child: Center(
        child: Text('Laundry'),
      ),
    );
  }
}
