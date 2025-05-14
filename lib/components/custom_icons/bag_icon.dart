import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class BagIcon extends IconTemplate {
  const BagIcon({super.key})
    : super(
        assetPath: 'assets/images/bag.svg',
        fit: BoxFit.contain,
        width: 29,
        height: 29,
      );
}
