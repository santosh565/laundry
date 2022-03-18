import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/screens/auth/bloc/auth_bloc.dart';
import 'package:laundry/screens/auth/login.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const Laundry(), // Wrap your app
    ),
  );
}

class Laundry extends StatelessWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const CupertinoScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue),
      themeMode: ThemeMode.light,
      title: 'Laundry',
      onGenerateRoute: Routes.cupertinopageRoute,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuth.instance),
        child: const Login(),
      ),
    );
  }
}
