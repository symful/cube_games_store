import 'package:cube_games_store/components/home/home_game_image.dart';
import 'package:flutter/material.dart';

class HomeGameThumbnail extends HomeGameImage {
  HomeGameThumbnail({
    super.key,
    required super.borderRadiusSize,
    required super.game,
  }) : super(imageUrl: game.thumbnailUrl, fit: BoxFit.fill);
}
