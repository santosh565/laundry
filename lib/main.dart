import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/wrapper.dart';
import 'services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Laundry());
}

class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<String?>.value(
      initialData: null,
      value: AuthService().userUid,
      child: MaterialApp(
        scrollBehavior: const CupertinoScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue),
        themeMode: ThemeMode.light,
        title: 'Laundry',
        home: const Wrapper(),
      ),
    );
  }
}
