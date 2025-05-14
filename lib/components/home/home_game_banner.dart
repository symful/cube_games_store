import 'package:cube_games_store/components/home/home_game_image.dart';

class HomeGameBanner extends HomeGameImage {
  HomeGameBanner({
    super.key,
    required super.borderRadiusSize,
    required super.game,
  }) : super(imageUrl: game.bannerUrl);
}
