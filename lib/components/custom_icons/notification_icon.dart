import 'package:cube_games_store/components/custom_icons/icon_template.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends IconTemplate {
  const NotificationIcon({super.key})
    : super(
        assetPath: 'assets/images/notification.svg',
        fit: BoxFit.contain,
        width: 29,
        height: 29,
      );
}
