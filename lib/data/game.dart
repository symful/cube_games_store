// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Game {
  final String title;
  final String description;
  final DateTime releaseDate;
  final List<Platform> platforms;
  final double rating;
  final String thumbnailUrl;
  final String videoUrl;
  final double price;
  final String currencyTag = "\$";

  Game({
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.platforms,
    required this.rating,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.price,
  });

  List<Widget> getIcons() {
    return platforms.map((platform) {
      switch (platform) {
        case Platform.WINDOWS:
          return const Icon(Icons.computer);
        case Platform.PS5:
          return const Icon(Icons.play_arrow);
        case Platform.PS4:
          return const Icon(Icons.play_arrow);
        case Platform.XBOX:
          return const Icon(Icons.play_arrow);
        case Platform.SWITCH:
          return const Icon(Icons.switch_access_shortcut);
        case Platform.ANDROID:
          return const Icon(Icons.android);
        case Platform.IOS:
          return const Icon(Icons.apple);
        case Platform.MAC:
          return const Icon(Icons.apple);
        case Platform.LINUX:
          return const Icon(Icons.computer);
        case Platform.WEB:
          return const Icon(Icons.web);
      }
    }).toList();
  }
}

enum Platform { WINDOWS, PS5, PS4, XBOX, SWITCH, ANDROID, IOS, MAC, LINUX, WEB }

final List<Game> fakeGames = [
  Game(
    description: 'Game 1',
    price: 9.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 1',
    rating: 4.5,
    releaseDate: DateTime(2025, 1, 1),
    platforms: [Platform.PS5],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
  Game(
    description: 'Game 2',
    price: 19.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 2',
    rating: 4.0,
    releaseDate: DateTime(2025, 2, 1),
    platforms: [Platform.PS4],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
  Game(
    description: 'Game 3',
    price: 29.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 3',
    rating: 4.8,
    releaseDate: DateTime(2025, 3, 1),
    platforms: [Platform.WINDOWS],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
  Game(
    description: 'Game 4',
    price: 39.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 4',
    rating: 3.5,
    releaseDate: DateTime(2025, 4, 1),
    platforms: [Platform.SWITCH],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
  Game(
    description: 'Game 5',
    price: 49.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 5',
    rating: 4.2,
    releaseDate: DateTime(2025, 5, 1),
    platforms: [Platform.ANDROID],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),

  Game(
    description: 'Game 6',
    price: 59.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 6',
    rating: 4.7,
    releaseDate: DateTime(2025, 6, 1),
    platforms: [Platform.IOS],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
  Game(
    description: 'Game 7',
    price: 69.99,
    thumbnailUrl: 'https://picsum.photos/3000/3000',
    title: 'Game 7',
    rating: 4.1,
    releaseDate: DateTime(2025, 7, 1),
    platforms: [Platform.MAC],
    videoUrl:
        'https://drive.google.com/uc?export=download&id=1CJ7xLGPSj2JiUWw-BDXdNhUlfWfHTm8F',
  ),
];
