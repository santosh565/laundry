import 'package:flutter/cupertino.dart';
import 'package:laundry/screens/auth/authentication_screen.dart';

import 'screens/auth/auth.dart';
import 'screens/home/home.dart';
import 'screens/splash_screen.dart';

class RouteName {
  RouteName._();
  static const String registerScreen = 'registerScreen';
  static const String homeScreen = 'homeScreen';
}

abstract class Routes {
  static CupertinoPageRoute cupertinopageRoute(RouteSettings routeSettings) {
    // var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      // case RouteName.loginScreen:
      //   return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RouteName.registerScreen:
        return CupertinoPageRoute(builder: (_) => const Register());
      case RouteName.homeScreen:
        return CupertinoPageRoute(builder: (_) => const Home());
      case AuthenticationScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const AuthenticationScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
