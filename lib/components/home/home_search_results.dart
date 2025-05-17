import 'package:cube_games_store/data/game.dart';
import 'package:cube_games_store/pages/overview/overview_page.dart';
import 'package:cube_games_store/theme.dart';
import 'package:cube_games_store/navigator.dart';
import 'package:flutter/material.dart';

class HomeSearchResults extends StatelessWidget {
  final List<Game> gamesList;
  const HomeSearchResults({super.key, required this.gamesList});

  static Future<List<Game>> fetchGames(String query) async {
    return fakeGames.where((game) {
      return game.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children:
                gamesList.map((game) => HomeSearchResult(game: game)).toList(),
          ),
        ),
      ),
    );
  }
}

class HomeSearchResult extends StatelessWidget {
  final Game game;
  const HomeSearchResult({super.key, required this.game});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushPage(context, (_) => OverviewPage(game: game));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.network(game.thumbnailUrl, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${game.currencyTag}${game.price}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
