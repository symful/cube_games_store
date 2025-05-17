import 'package:cube_games_store/components/home/home_game_image.dart';
import 'package:flutter/material.dart';

class GameThumbnail extends HomeGameImage {
  GameThumbnail({
    super.key,
    required super.borderRadiusSize,
    required super.game,
  }) : super(imageUrl: game.thumbnailUrl, fit: BoxFit.cover);
}
