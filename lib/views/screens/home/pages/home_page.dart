import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../search/screen.dart';

class HomePage extends StatefulWidget {
  static const String name = "home";
  static const String path = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "홈",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.pushNamed(SearchScreen.name),
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildMyWorkSection(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 0.5,
            ),
            _buildFavoritesSection(),
            _buildRecentSection(),
          ],
        ),
      ),
    );
  }

  _buildMyWorkSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "내 작업",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildWorkListTile(
            iconData: Icons.error_outline,
            color: Colors.green.shade400,
            text: "이슈",
          ),
          _buildWorkListTile(
            iconData: Icons.subdirectory_arrow_left_outlined,
            color: Colors.blue.shade400,
            text: "Pull Requests",
          ),
          _buildWorkListTile(
            iconData: Icons.comment_outlined,
            color: Colors.purple.shade400,
            text: "Discussion",
          ),
          _buildWorkListTile(
            iconData: Icons.my_library_books_outlined,
            color: Colors.grey.shade400,
            text: "프로젝트",
          ),
          _buildWorkListTile(
            iconData: Icons.book,
            color: Colors.black.withOpacity(0.7),
            text: "리포지토리",
          ),
          _buildWorkListTile(
            iconData: Icons.business,
            color: Colors.orange.shade400,
            text: "조직",
          ),
          _buildWorkListTile(
            iconData: Icons.star_outline_rounded,
            color: Colors.yellow.shade600,
            text: "별표 표시됨",
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  _buildWorkListTile({
    required IconData iconData,
    required String text,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  _buildFavoritesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Row(
            children: [
              Text(
                "즐겨찾기",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "언제든지 검색할 필요 없이 빠른 액세스를 위해 즐겨 찾는 리포지토리 추가",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "즐겨찾기 추가",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  _buildRecentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Row(
            children: [
              Text(
                "바로 가기",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildOverlappingIcons(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "필요한 항목, 한 번만 탭하면 이용 가능",
                    style: TextStyle(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "이슈, Pull Request 또는 토론 목록에 빠르게 액세스",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "시작",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildOverlappingIcons() {
    const overlap = 24.0;
    final items = [
      _buildRoundIcon(
        iconData: Icons.electric_bolt,
        color: Colors.black,
      ),
      _buildRoundIcon(
        iconData: Icons.error_outline,
        color: Colors.green,
      ),
      _buildRoundIcon(
        iconData: Icons.subdirectory_arrow_left,
        color: Colors.blue,
      ),
      _buildRoundIcon(
        iconData: Icons.comment,
        color: Colors.purple,
      ),
      _buildRoundIcon(
        iconData: Icons.business,
        color: Colors.orange,
      ),
      _buildRoundIcon(
        iconData: Icons.person,
        color: Colors.red,
      ),
      _buildRoundIcon(
        iconData: Icons.business_center_outlined,
        color: Colors.purple,
      ),
      _buildRoundIcon(
        iconData: Icons.description_outlined,
        color: Colors.black,
      ),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }

  _buildRoundIcon({
    required IconData iconData,
    required Color color,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 14,
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        radius: 12,
        child: Center(
          child: Icon(
            iconData,
            color: color,
            size: 16,
          ),
        ),
      ),
    );
  }
}
