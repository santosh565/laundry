import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry/routes.dart';

import 'screens/auth/auth.dart';
import 'screens/auth/bloc/auth_bloc.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const CupertinoScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue),
      themeMode: ThemeMode.light,
      title: 'LaundryApp',
      onGenerateRoute: Routes.cupertinopageRoute,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuth.instance),
        child: const Login(),
      ),
    );
  }
}