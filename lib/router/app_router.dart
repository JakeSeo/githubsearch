import 'package:flutter/widgets.dart';
import 'package:githubsearch/utils.dart';
import 'package:go_router/go_router.dart';

import '../blocs/search/bloc.dart';
import '../views/screens/home/pages/home_page.dart';
import '../views/screens/home/pages/profile_page.dart';
import '../views/screens/home/screen.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/search/screen.dart';
import '../views/screens/search_result_screen.dart';
import '../views/screens/settings_screen.dart';
import '../views/screens/splash_screen.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter appRouter = GoRouter(
    navigatorKey: rootKey,
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        name: SplashScreen.name,
        path: SplashScreen.path,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        name: LoginScreen.name,
        path: LoginScreen.path,
        builder: (_, __) => const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: shellNavKey,
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            parentNavigatorKey: shellNavKey,
            name: HomePage.name,
            path: HomePage.path,
            builder: (_, __) => const HomePage(),
          ),
          GoRoute(
            parentNavigatorKey: shellNavKey,
            name: ProfilePage.name,
            path: ProfilePage.path,
            builder: (_, __) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        name: SearchScreen.name,
        path: SearchScreen.path,
        builder: (_, __) => const SearchScreen(),
        routes: [
          GoRoute(
              name: SearchResultScreen.name,
              path: SearchResultScreen.path,
              builder: (context, state) {
                final type =
                    state.pathParameters["type"]?.toString().toSearchType();
                final query = state.uri.queryParameters["q"];
                SearchBloc? bloc = state.extra as SearchBloc;
                return SearchResultScreen(
                  type: type,
                  bloc: bloc,
                  query: query ?? "",
                );
              }),
        ],
      ),
      GoRoute(
        name: SettingsScreen.name,
        path: SettingsScreen.path,
        builder: (_, __) => const SettingsScreen(),
      ),
    ],
  );
}
