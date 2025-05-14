import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class LogoIcon extends IconTemplate {
  const LogoIcon({super.key, super.width, super.height})
    : super(assetPath: 'assets/images/logo.svg', fit: BoxFit.contain);
}
