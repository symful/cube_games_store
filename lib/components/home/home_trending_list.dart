import 'package:cube_games_store/components/home/home_game_thumbnail.dart';
import 'package:cube_games_store/components/home/home_page_indicator.dart';
import 'package:cube_games_store/data/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeTrendingList extends StatefulWidget {
  const HomeTrendingList({super.key});

  @override
  State<HomeTrendingList> createState() => _HomeTrendingListState();
}

class _HomeTrendingListState extends State<HomeTrendingList>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  List<Game> _trendsList = [];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
    _trendsList = [...fakeGames.take(3)];
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 16,
          child: PageView(
            allowImplicitScrolling: true,
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children:
                _trendsList.map((game) {
                  return HomeGameThumbnail(game: game, borderRadiusSize: 8);
                }).toList(),
          ),
        ),
        HomePageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          isOnDesktopAndWeb: _isOnDesktopAndWeb,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb =>
      kIsWeb ||
      switch (defaultTargetPlatform) {
        TargetPlatform.macOS ||
        TargetPlatform.linux ||
        TargetPlatform.windows => true,
        TargetPlatform.android ||
        TargetPlatform.iOS ||
        TargetPlatform.fuchsia => false,
      };
}
