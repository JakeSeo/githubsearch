import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/auth/bloc.dart';
import '../common/custom_icon.dart';
import '../view_utils.dart';
import 'home/pages/home_page.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "login";
  static const String path = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          context.goNamed(HomePage.name);
        }
      },
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                  tag: "hero_logo",
                  child: CustomIcon("icon_logo.svg"),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () =>
                                context.read<AuthBloc>().add(Login()),
                            child: state is LoggingIn
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: ViewUtils.mainBlack,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : const Text("로그인"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
