import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class HeartIcon extends ClickableIconTemplate {
  const HeartIcon({super.key, required super.onTap})
    : super(
        assetPath: 'assets/images/heart.svg',
        fit: BoxFit.cover,
        width: 42,
        height: 42,
      );
}
