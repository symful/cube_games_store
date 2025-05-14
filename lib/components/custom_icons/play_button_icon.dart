import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class PlayButtonIcon extends IconTemplate {
  const PlayButtonIcon({super.key})
    : super(
        assetPath: 'assets/images/play_button.svg',
        fit: BoxFit.cover,
        width: 108.79,
        height: 100.69,
      );
}
