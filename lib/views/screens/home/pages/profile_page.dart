import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../settings_screen.dart';

class ProfilePage extends StatefulWidget {
  static const String name = "profile";
  static const String path = "/profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _appBarScrollController = ScrollController();
  @override
  initState() {
    super.initState();
    _mainScrollController.addListener(() {
      if (_mainScrollController.offset <=
          _appBarScrollController.position.maxScrollExtent) {
        _appBarScrollController.jumpTo(_mainScrollController.offset);
      } else {
        _appBarScrollController
            .jumpTo(_appBarScrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox(
          height: kToolbarHeight,
          child: SingleChildScrollView(
            controller: _appBarScrollController,
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "JakeSeo",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "DongSeong Seo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () => context.pushNamed(SettingsScreen.name),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _mainScrollController,
        child: Column(
          children: List.generate(
              500,
              (index) => Row(
                    children: [
                      Text("$index"),
                    ],
                  )),
        ),
      ),
    );
  }
}
