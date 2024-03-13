import 'package:flutter/material.dart';
import 'package:githubsearch/views/common/custom_icon.dart';

import '../view_utils.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      if (context.mounted) {
        LoginScreen.pushNamedAndRemoveUntil(context,
            arguments: LoginArguments());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ViewUtils.mainBlack,
      body: Center(
        child: Hero(
          tag: "hero_logo",
          child: CustomIcon("icon_logo_inverted.svg"),
        ),
      ),
    );
  }
}
