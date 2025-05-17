// ignore_for_file: constant_identifier_names

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/regular/apple_mac.dart';
import 'package:iconoir_flutter/regular/playstation_gamepad.dart';
import 'package:iconoir_flutter/regular/windows.dart';

class Game {
  final String title;
  final String description;
  final DateTime releaseDate;
  final List<Platform> platforms;
  final double rating;
  final String thumbnailUrl;
  final String bannerUrl;
  final String videoUrl;
  final double price;
  final String currencyTag = "\$";
  final String id;
  final String iconUrl;

  Game({
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.platforms,
    required this.rating,
    required this.thumbnailUrl,
    required this.bannerUrl,
    required this.videoUrl,
    required this.price,
    required this.id,
    required this.iconUrl,
  });

  String get formattedPrice {
    return price == 0 ? 'FREE' : '$currencyTag$price';
  }

  static IconData getIconData(Platform platform) {
    switch (platform) {
      case Platform.XBOX:
        return FluentIcons.xbox_console_24_filled;
      case Platform.ANDROID:
        return Icons.android;
      case Platform.MAC:
        return FluentIcons.desktop_mac_24_filled;
      case Platform.WEB:
        return Icons.web;
      default:
        throw Exception('Unknown platform: $platform');
    }
  }

  static Widget getIconWidget(Platform platform) {
    switch (platform) {
      case Platform.PS:
        return const PlaystationGamepad(
          width: 20,
          height: 20,
          color: Colors.white,
        );
      case Platform.WINDOWS:
        return const Windows(width: 20, height: 20, color: Colors.white);
      case Platform.IOS:
        return const AppleMac(width: 20, height: 20, color: Colors.white);
      default:
        return Icon(getIconData(platform), size: 20, color: Colors.white);
    }
  }

  List<Widget> getIcons() {
    return platforms.map((platform) {
      return Tooltip(message: platform.name, child: getIconWidget(platform));
    }).toList();
  }
}

enum Platform { WINDOWS, PS, XBOX, ANDROID, IOS, MAC, WEB }

final List<Game> fakeGames = [
  Game(
    id: 'call_of_duty_mobile',
    description:
        'Call of Duty: Mobile (CODM) is a free-to-play first-person shooter (FPS) video game developed by TiMi Studio Group and published by Activision for Android and iOS. It is known for offering a mobile-friendly version of the popular Call of Duty franchise, featuring both multiplayer and Battle Royale modes. The game allows players to engage in fast-paced battles, customize their loadouts, and experience console-quality graphics and sound on their mobile devices.',
    price: 0,
    thumbnailUrl:
        'https://drive.google.com/uc?export=download&id=1sAsF3qOGR0ONSJnhxVZCEhUTNYpAG40n',
    bannerUrl:
        'https://drive.google.com/uc?export=download&id=1TrGEgd1anKb-xB_sHrETtapcqrUjcCTz',
    title: 'Call of Duty Mobile',
    rating: 4.3,
    releaseDate: DateTime(2019, 10, 1),
    platforms: [Platform.ANDROID, Platform.IOS],
    iconUrl:
        'https://drive.google.com/uc?export=download&id=1hfiK4axhziYRbDVnWnJfYyRamitzIFW2',
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1N10VKZE8L5z7QhgR4J0NHHbWBtKQbO7e',
  ),
  Game(
    id: 'pubg',
    description:
        'PUBG: BATTLEGROUNDS, the high-stakes winner-take-all shooter that started the Battle Royale craze, is free-to-play! Drop into diverse maps, loot unique weapons and supplies, and survive in an ever-shrinking zone where every turn could be your last.',
    price: 0,
    thumbnailUrl:
        'https://drive.google.com/uc?export=download&id=1MSYUYYQXxXnc1K-DQohY9nIZkreO-UoQ',
    bannerUrl:
        'https://drive.google.com/uc?export=download&id=1dl2ZGm-C-nzSu48_e6uY_BmFuuE-kygH',
    title: 'PUBG: BATTLEGROUNDS',
    rating: 3.0,
    releaseDate: DateTime(2017, 3, 23),
    platforms: [Platform.PS, Platform.WINDOWS, Platform.XBOX],
    iconUrl:
        'https://drive.google.com/uc?export=download&id=1ukjkll6bOJJMcl9pz4BkdxDPAR-KNEzB',
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1hD1JlYQkY5wuKKhf5TjygCO-BqUNT61N',
  ),
  Game(
    id: 'game3',
    description:
        'Minecraft is a game made up of blocks, creatures, and community. You can survive the night or build a work of art – the choice is all yours. But if the thought of exploring a vast new world all on your own feels overwhelming, then fear not! Let\'s explore what Minecraft is all about!\n\nMinecraft has no set goal and can be played however you\'d like! This is why it\'s sometimes called a “sandbox game” – there are lots of things for you to do, and lots of ways that you can play. If you like being creative, then you can use the blocks to build things from your imagination. If you\'re feeling brave, you can explore the world and face daring challenges. Blocks can be broken, crafted, placed to reshape the landscape, or used to build fantastical creations.\n\nCreatures can be battled or befriended, depending on how you play. The world of Minecraft allows for epic adventures, quiet meditations, and everything in between. You can even share your creations with other players, or play in community worlds!',
    price: 29.99,
    thumbnailUrl:
        'https://drive.google.com/uc?export=download&id=1dpUX4LyDSjoqFSogSWcbusR2y2MklgkZ',
    bannerUrl:
        'https://drive.google.com/uc?export=download&id=1nFQ6Kvp216w2lQeVMOPXu7Ub49bH-gwR',
    title: 'Minecraft',
    rating: 4.8,
    releaseDate: DateTime(2025, 3, 1),
    platforms: [
      Platform.WINDOWS,
      Platform.PS,
      Platform.XBOX,
      Platform.ANDROID,
      Platform.IOS,
      Platform.MAC,
    ],
    iconUrl:
        'https://drive.google.com/uc?export=download&id=1skTrx3O0ztC-_Nc-nVuKlhFmN9gK5Z0x',
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1I8iXC3fzd3q0DVwDmJbEGXR_o8lagzwz',
  ),
];
