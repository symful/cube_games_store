import 'package:cube_games_store/components/custom_icons/play_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;

  const VideoPlayer({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final player = Player();
  late final controller = VideoController(player);
  bool hasStarted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Video(controller: controller),
        if (!hasStarted)
          InkWell(
            onTap: () {
              setState(() {
                hasStarted = true;
              });
              player.open(Media(widget.videoUrl), play: true);
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      Image.network(
                        widget.thumbnailUrl,
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                      ),
                      Center(child: PlayButtonIcon()),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
