import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:githubsearch/injector.dart';

import 'blocs/auth/bloc.dart';
import 'router/app_router.dart';
import 'views/view_utils.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: injector.get<AppRouter>().appRouter,
          title: 'GitHub Search',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ViewUtils.mainBlack),
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.grey.shade200,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
