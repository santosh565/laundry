import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/wrapper.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Laundry());
}

class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Laundry',
      home: Wrapper(),
    );
  }
}
