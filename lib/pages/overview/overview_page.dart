import 'package:cube_games_store/components/overview/video_player.dart';
import 'package:cube_games_store/data/game.dart';
import 'package:flutter/material.dart';
import 'package:cube_games_store/components/custom_icons/back_arrow_button_icon.dart';
import 'package:iconly/iconly.dart';

class OverviewPage extends StatefulWidget {
  final Game game;
  const OverviewPage({super.key, required this.game});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  bool isFavorited = false;
  Game get game => widget.game;
  Widget get lineDivider => SizedBox(
    height: 24,
    child: VerticalDivider(width: 40, thickness: 1, color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leadingWidth: 43 + 16 * 3,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BackArrowButtonIcon(),
        ),
        title: const Text('OVERVIEW'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: Icon(isFavorited ? IconlyBold.heart : IconlyLight.heart),
              onPressed: () => setState(() => isFavorited = !isFavorited),
              iconSize: 43,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 9 / 20,
                child: VideoPlayer(
                  videoUrl: game.videoUrl,
                  thumbnailUrl: game.thumbnailUrl,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                game.title,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    game.releaseDate.year.toString(),
                    style: TextStyle(
                      color: Color(0xff65EF23),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  lineDivider,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(spacing: 4, children: game.getIcons()),
                  ),
                  lineDivider,
                  Icon(IconlyBold.star, color: Color(0xffFFCC02), size: 24),
                  const SizedBox(width: 4),
                  Text(
                    game.rating.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  game.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60 - 8 * 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8), // Top-right rounded
                          bottomLeft: Radius.circular(8), // Bottom-left rounded
                          // Other corners remain square
                        ),
                      ),
                    ),
                    child: Text(
                      'BUY',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      '${game.currencyTag}${game.price}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Revamped',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
