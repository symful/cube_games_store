import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends IconTemplate {
  const ProfileIcon({super.key})
    : super(
        assetPath: 'assets/images/profile.svg',
        fit: BoxFit.contain,
        width: 29,
        height: 29,
      );
}
