import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubsearch/views/screens/home_screen.dart';

import '../../blocs/auth/bloc.dart';
import '../common/custom_icon.dart';
import '../view_utils.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "/login";
  const LoginScreen({super.key});

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
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          HomeScreen.pushNamedAndRemoveUntil(context);
        }
      },
      child: Scaffold(
        backgroundColor: ViewUtils.mainBlack,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                  tag: "hero_logo",
                  child: CustomIcon("icon_logo_inverted.svg"),
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
