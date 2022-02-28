import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<String?>(context);
    debugPrint('Wrapper: userId = $userId');
    return const Center(
      child: Authenticate(),
    );
  }
}
