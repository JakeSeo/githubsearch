import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/auth/bloc.dart';
import '../common/custom_icon.dart';
import '../view_utils.dart';
import 'home/pages/home_page.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String name = "splash";
  static const String path = "/splash";
  const SplashScreen({super.key});

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
    if (mounted) context.goNamed(LoginScreen.name);
  }

  _goToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) context.goNamed(HomePage.name);
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
          Fluttertoast.showToast(
              msg:
                  "토큰 오류: (${state.errorCode}${state.error == null ? "" : " ${state.error}"})");
          _goToLoginScreen();
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
