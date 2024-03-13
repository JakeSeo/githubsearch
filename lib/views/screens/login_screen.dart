import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../common/custom_icon.dart';
import '../view_utils.dart';

class LoginArguments extends ScreenArguments {}

class LoginScreen extends StatelessWidget {
  static const String name = "/login";
  const LoginScreen({super.key, required this.arguments});

  final LoginArguments arguments;

  static pushNamedAndRemoveUntil(
    BuildContext context, {
    required LoginArguments arguments,
  }) async {
    return await Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      (route) => false,
      arguments: arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("로그인"),
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
