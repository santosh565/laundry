import 'package:flutter/cupertino.dart';
import 'package:laundry/screens/home/home.dart';

import 'screens/auth/auth.dart';
import 'screens/wrapper.dart';

class RouteName {
  RouteName._();
  static const String loginScreen = 'loginScreen';
  static const String registerScreen = 'registerScreen';
  static const String homeScreen = 'homeScreen';
}

abstract class Routes {
  static CupertinoPageRoute cupertinopageRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      // case RouteName.loginScreen:
      //   return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RouteName.loginScreen:
        return CupertinoPageRoute(builder: (_) => const Login());
      case RouteName.registerScreen:
        return CupertinoPageRoute(builder: (_) => const Register());
        case RouteName.homeScreen:
        return CupertinoPageRoute(builder: (_) =>  Home());

      default:
        return CupertinoPageRoute(builder: (_) => const Wrapper());
    }
  }
}
