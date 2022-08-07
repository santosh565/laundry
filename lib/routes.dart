import 'package:flutter/cupertino.dart';
import 'package:laundry/screens/auth/authentication_screen.dart';

import 'screens/auth/auth.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash_screen.dart';

abstract class Routes {
  static CupertinoPageRoute cupertinopageRoute(RouteSettings routeSettings) {
    // var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      // case RouteName.loginScreen:
      //   return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      case AuthenticationScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const AuthenticationScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
