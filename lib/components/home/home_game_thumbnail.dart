import 'package:cube_games_store/data/game.dart';
import 'package:cube_games_store/pages/overview/overview_page.dart';
import 'package:flutter/material.dart';

class HomeGameThumbnail extends StatelessWidget {
  final Game game;
  final double borderRadiusSize;

  const HomeGameThumbnail({
    super.key,
    required this.game,
    required this.borderRadiusSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OverviewPage(game: game)),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Image.network(
            game.thumbnailUrl,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusSize),
                child: child,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Icon(Icons.error));
            },
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
