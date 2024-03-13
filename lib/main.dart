import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'views/screens/splash_screen.dart';
import 'views/view_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search',
      routes: Routes.routes,
      initialRoute: SplashScreen.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ViewUtils.mainBlack),
        useMaterial3: true,
      ),
    );
  }
}
