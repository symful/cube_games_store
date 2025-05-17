import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayButtonIcon extends StatelessWidget {
  const PlayButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/play_button.svg',
      fit: BoxFit.cover,
      width: 108.79,
      height: 100.69,
    );
  }
}
