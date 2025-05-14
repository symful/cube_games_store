import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class SuccessIcon extends IconTemplate {
  const SuccessIcon({super.key})
    : super(
        assetPath: 'assets/images/success.svg',
        fit: BoxFit.contain,
        width: 166,
        height: 166,
      );
}
