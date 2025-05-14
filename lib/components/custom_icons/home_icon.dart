import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class HomeIcon extends IconTemplate {
  const HomeIcon({super.key})
    : super(
        assetPath: 'assets/images/home.svg',
        fit: BoxFit.contain,
        width: 29,
        height: 29,
      );
}
