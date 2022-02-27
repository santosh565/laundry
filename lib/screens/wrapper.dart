import 'package:flutter/material.dart';

import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Authenticate(),
    );
  }
}
