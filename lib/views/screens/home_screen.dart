import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/bloc.dart';
import '../common/custom_icon.dart';
import '../view_utils.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "/home";
  const HomeScreen({
    super.key,
  });

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
        if (state is NotLoggedIn) {
          LoginScreen.pushNamedAndRemoveUntil(context);
        }
      },
      child: Scaffold(
        backgroundColor: ViewUtils.mainBlack,
        appBar: AppBar(
          backgroundColor: ViewUtils.mainBlack,
          leading: const Center(
            child: Hero(
              tag: "hero_logo",
              child: CustomIcon(
                "icon_logo_inverted.svg",
                height: 32,
                width: 32,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () =>
                              context.read<AuthBloc>().add(Logout()),
                          child: state is LoggingOut
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
                              : const Text(
                                  "로그아웃",
                                ),
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
    );
  }
}
