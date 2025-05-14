import 'package:cube_games_store/components/custom_icons/bag_icon.dart';
import 'package:cube_games_store/components/custom_icons/home_icon.dart';
import 'package:cube_games_store/components/custom_icons/logo_icon.dart';
import 'package:cube_games_store/components/custom_icons/notification_icon.dart';
import 'package:cube_games_store/components/custom_icons/profile_icon.dart';
import 'package:cube_games_store/components/home/home_sale_section.dart';
import 'package:cube_games_store/components/home/home_search_field.dart';
import 'package:cube_games_store/components/home/home_search_results.dart';
import 'package:cube_games_store/components/home/home_trending_list.dart';
import 'package:cube_games_store/data/game.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Game> _searchResults = [];
  final SaleEvent saleEvent = SaleEvent(
    name: 'RAMADHAN SALE',
    games: fakeGames,
  );

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
      (() async {
        _searchResults = await HomeSearchResults.fetchGames(
          _searchController.text,
        );
      })();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125,
        leadingWidth: 54.33 + 16 * 2,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LogoIcon(width: 54.33, height: 53),
        ),
        title: SizedBox(
          height: 125,
          child: Center(
            child: Text('CUBE\nGAMES', textAlign: TextAlign.center),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 27.5,
              foregroundImage: AssetImage('assets/images/tingyun.jpeg'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: HomeSearchField(
              searchController: _searchController,
              submit: () {},
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        HomeTrendingList(),
                        const SizedBox(height: 16),
                        HomeSaleSection(saleEvent: saleEvent),
                      ],
                    ),
                  ),
                ),
                if (_isSearching) HomeSearchResults(gamesList: _searchResults),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        selectedFontSize: 0,
        backgroundColor: Color(0xff1b2134),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _buildBottomNavigationBarItem(HomeIcon(), 0),
          _buildBottomNavigationBarItem(BagIcon(), 1),
          _buildBottomNavigationBarItem(NotificationIcon(), 2),
          _buildBottomNavigationBarItem(ProfileIcon(), 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    Widget icon,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 82,
        width: 29,
        child: Stack(
          alignment: Alignment.center,
          children: [
            icon,
            if (index == 0)
              Container(
                height: 82,
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 3, // Line thickness
                  width: 29,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
      label: '',
    );
  }
}
