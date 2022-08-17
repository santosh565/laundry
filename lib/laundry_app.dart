import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';
import 'screens/auth/bloc/auth_bloc.dart';
import 'screens/splash_screen.dart';

class LaundryApp extends StatelessWidget {
  const LaundryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(FirebaseAuth.instance)..add(const AppStartEvent()),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: const CupertinoScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.hippieBlue),
        themeMode: ThemeMode.light,
        title: 'LaundryApp',
        onGenerateRoute: Routes.cupertinopageRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
