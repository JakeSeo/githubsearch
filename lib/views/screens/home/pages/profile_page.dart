import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/profile/bloc.dart';
import '../../../common/custom_icon.dart';
import '../../settings_screen.dart';

class ProfilePage extends StatefulWidget {
  static const String name = "profile";
  static const String path = "/profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey _profileSectionKey = GlobalKey();
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _appBarScrollController = ScrollController();

  double _profileSecitonHeight = 300;
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateProfileSectionHeight();
    });
  }

  _updateProfileSectionHeight() {
    final renderBox =
        _profileSectionKey.currentContext!.findRenderObject() as RenderBox;
    _profileSecitonHeight = renderBox.size.height;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is LoadedProfile) {
          _updateProfileSectionHeight();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: SizedBox(
            height: kToolbarHeight,
            child: SingleChildScrollView(
              controller: _appBarScrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: _profileSecitonHeight + kToolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: kToolbarHeight,
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.profile?.login ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                state.profile?.name ?? "",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          );
                        },
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
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileBloc>().add(LoadProfile());
          },
          child: SingleChildScrollView(
            controller: _mainScrollController,
            child: Column(
              children: [
                _buildProfileSection(),
                const SizedBox(height: 16),
                Container(
                  height: 400,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 400,
                  color: Colors.white,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProfileSection() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          key: _profileSectionKey,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      state.profile!.avatarUrl,
                      height: 64,
                      width: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.profile?.name ?? "",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        state.profile?.login ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.profile?.bio == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(state.profile?.bio ?? "")),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.profile?.company == null &&
                      state.profile?.location == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          if (state.profile?.company != null)
                            Row(
                              children: [
                                Icon(
                                  Icons.business,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 4),
                                Text(state.profile?.company ?? ""),
                              ],
                            ),
                          if (state.profile?.location != null) ...{
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(width: 4),
                                Text(state.profile?.location ?? ""),
                              ],
                            ),
                          },
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.profile?.blog == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.link, color: Colors.grey.shade400),
                          const SizedBox(width: 8),
                          Text(
                            state.profile?.blog ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.profile?.email == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.email_outlined,
                              color: Colors.grey.shade400),
                          const SizedBox(width: 8),
                          Text(
                            state.profile?.email ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.profile?.twitterUsername == null) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          CustomIcon(
                            "icon_twitter.svg",
                            color: Colors.grey.shade400,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "@${state.profile?.twitterUsername ?? ""}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  int followers = state.profile?.followers ?? 0;
                  int following = state.profile?.following ?? 0;
                  if (followers == 0 && following == 0) {
                    return const SizedBox();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.grey.shade400),
                          const SizedBox(width: 8),
                          if (followers > 0)
                            Text(
                              "$followers명이 팔로우 중",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          if (followers > 0 && following > 0) ...[
                            const SizedBox(width: 4),
                            const Text("•"),
                            const SizedBox(width: 4),
                          ],
                          if (following > 0)
                            Text(
                              "$following명 팔로우 중",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
