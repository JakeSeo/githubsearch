import 'package:flutter/material.dart';

import '../views/screens/login_screen.dart';
import '../views/screens/splash_screen.dart';

class ScreenArguments {
  static instance(BuildContext context) =>
      ModalRoute.of(context)!.settings.arguments as ScreenArguments;
}

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.name: (_) => const SplashScreen(),
    LoginScreen.name: (context) => LoginScreen(
          arguments: ScreenArguments.instance(context) as LoginArguments,
        ),
  };
}
