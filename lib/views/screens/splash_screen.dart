import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubsearch/views/common/custom_icon.dart';

import '../../blocs/auth/bloc.dart';
import '../view_utils.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String name = "/splash";
  const SplashScreen({super.key});

  static pushNamedAndRemoveUntil(
    BuildContext context,
  ) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      (route) => false,
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthInitialize());
  }

  _goToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) LoginScreen.pushNamedAndRemoveUntil(context);
  }

  _goToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) HomeScreen.pushNamedAndRemoveUntil(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          _goToHomeScreen();
        }
        if (state is NotLoggedIn) {
          _goToLoginScreen();
        }
        if (state is AuthError) {
          print("AuthError: ${state.errorCode} ${state.error}");
        }
      },
      child: const Scaffold(
        backgroundColor: ViewUtils.mainBlack,
        body: Center(
          child: Hero(
            tag: "hero_logo",
            child: CustomIcon("icon_logo_inverted.svg"),
          ),
        ),
      ),
    );
  }
}
