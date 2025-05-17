import 'package:cube_games_store/data/game.dart';
import 'package:cube_games_store/pages/overview/overview_page.dart';
import 'package:cube_games_store/navigator.dart';
import 'package:flutter/material.dart';

class HomeGameImage extends StatelessWidget {
  final Game game;
  final double borderRadiusSize;

  const HomeGameImage({
    super.key,
    required this.game,
    required this.borderRadiusSize,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushPage(context, (_) => OverviewPage(game: game));
      },
      child: Image.network(
        imageUrl,
        fit: fit,
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
      ),
    );
  }
}
