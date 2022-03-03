import 'package:flutter/cupertino.dart';

import 'screens/auth/auth.dart';
import 'screens/wrapper.dart';


class RouteName {
  RouteName._();
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
 
}

abstract class Routes {
  static CupertinoPageRoute cupertinopageRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      // case RouteName.loginScreen:
      //   return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case RouteName.loginScreen:
        return CupertinoPageRoute(builder: (_) => const Login());
    

      default:
        return CupertinoPageRoute(builder: (_) => const Wrapper());
    }
  }
}
