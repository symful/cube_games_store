import 'package:cube_games_store/data/game.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  final Game game;
  const OverviewPage({super.key, required this.game});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  bool isFavorited = false;

  Game get game => widget.game;

  Widget get lineDivider => SizedBox(
    height: 24, // Explicit height
    child: VerticalDivider(width: 20, thickness: 1, color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: const Text('OVERVIEW'),
        actions: [
          IconButton(
            icon: Icon(isFavorited ? Icons.favorite : Icons.favorite_border),
            onPressed: () => setState(() => isFavorited = !isFavorited),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Start video player
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 9 / 16,
                child: const Center(child: Text('Video Trailer Thumbnail')),
              ),
            ),
            const SizedBox(height: 16),
            Text(game.title, style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  game.releaseDate.year.toString(),
                  style: TextStyle(color: Colors.green),
                ),
                lineDivider,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(spacing: 4, children: game.getIcons()),
                ),
                lineDivider,
                Icon(Icons.star, color: Colors.yellow),
                Text(game.rating.toString()),
              ],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text(game.description),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60 - 8 * 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8), // Top-right rounded
                          bottomLeft: Radius.circular(8), // Bottom-left rounded
                          // Other corners remain square
                        ),
                      ),
                    ),
                    child: Text('BUY'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '${game.currencyTag}${game.price}',
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
