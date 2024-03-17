import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/auth/bloc.dart';
import '../../blocs/profile/bloc.dart';
import 'home/pages/home_page.dart';
import 'home/pages/profile_page.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileInitialize());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NotLoggedIn) {
          context.goNamed(LoginScreen.name);
        }
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          onTap: (tabIndex) {
            if (tabIndex == 0) {
              context.goNamed(HomePage.name);
            } else if (tabIndex == 1) {
              context.goNamed(ProfilePage.name);
            }
            _tabIndex = tabIndex;
            setState(() {});
          },
          selectedFontSize: 12,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                return CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      _tabIndex == 1 ? Colors.blue : Colors.grey.shade300,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey.shade300,
                    child: Builder(
                      builder: (context) {
                        if (state.profile?.avatarUrl == null) {
                          return const SizedBox();
                        }
                        return ClipOval(
                          child: Image.network(
                            state.profile!.avatarUrl,
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
              label: '마이페이지',
            ),
          ],
        ),
      ),
    );
  }
}
