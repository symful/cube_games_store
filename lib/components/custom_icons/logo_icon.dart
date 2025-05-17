import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoIcon extends StatelessWidget {
  final double? width;
  final double? height;

  const LogoIcon({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      fit: BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
