import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/search/bloc.dart';
import '../../../../models/github_user/info.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserListSection(),
          Divider(color: Colors.grey.shade200),
          _buildOrganizationListSection(),
        ],
      ),
    );
  }

  _buildUserListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<SearchUsersBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "사용자",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.result.length < 3 ? state.result.length : 3,
                itemBuilder: (context, index) {
                  GithubUserInfo user = state.result[index] as GithubUserInfo;
                  return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipOval(
                        child: Image.network(
                          user.avatarUrl,
                          width: 42,
                          height: 42,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.login),
                        ],
                      ));
                },
              ),
              Row(
                children: [
                  Text(
                    "${state.totalCount - 3}명 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  _buildOrganizationListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<SearchOrganizationsBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "조직",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.result.length < 3 ? state.result.length : 3,
                itemBuilder: (context, index) {
                  GithubUserInfo user = state.result[index] as GithubUserInfo;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        user.avatarUrl,
                        width: 42,
                        height: 42,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.login),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${state.totalCount - 3}개 조직 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
