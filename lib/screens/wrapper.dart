import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<String?>(context);
    debugPrint('userid $userId ');
    if (userId == null) {
      return const Center(
        child: Authenticate(),
      );
    } else {
      return const Home();
    }
  }
}
