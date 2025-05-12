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
        leading: Placeholder(fallbackHeight: 40, fallbackWidth: 40),
        title: Text('CUBE GAMES'),
        centerTitle: true,
        actions: [
          CircleAvatar(
            child: Placeholder(fallbackHeight: 40, fallbackWidth: 40),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: HomeSearchField(searchController: _searchController),
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
        items: [
          _buildBottomNavigationBarItem(Icons.home, 0),
          _buildBottomNavigationBarItem(Icons.shopping_cart, 1),
          _buildBottomNavigationBarItem(Icons.notifications, 2),
          _buildBottomNavigationBarItem(Icons.person, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    IconData icon,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Icon(icon),
          if (index == 0)
            Container(
              height: 3, // Line thickness
              width: 20,
              color: Colors.green,
            ),
        ],
      ),
      label: '',
    );
  }
}
