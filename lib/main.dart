import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'blocs/auth/bloc.dart';
import 'routes/routes.dart';
import 'views/screens/splash_screen.dart';
import 'views/view_utils.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'GitHub Search',
        routes: Routes.routes,
        initialRoute: SplashScreen.name,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ViewUtils.mainBlack),
          useMaterial3: true,
        ),
      ),
    );
  }
}
