import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class BackArrowButtonIcon extends ClickableIconTemplate {
  const BackArrowButtonIcon({super.key, required super.onTap})
    : super(
        assetPath: 'assets/images/back_arrow_button.svg',
        fit: BoxFit.contain,
        width: 42,
        height: 42,
      );
}
