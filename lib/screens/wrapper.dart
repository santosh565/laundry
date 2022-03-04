import 'package:flutter/material.dart';
import 'package:laundry/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<String?>(context);
    if (userId == null) {
      debugPrint('userId: $userId');
      return const Center(
        child: Authenticate(),
      );
    } else {
      debugPrint('userId at home: $userId');
      Navigator.pop(context);
      return const Home();
    }
  }
}
