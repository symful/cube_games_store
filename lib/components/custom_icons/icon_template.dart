import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconTemplate extends StatelessWidget {
  final String assetPath;
  final BoxFit fit;
  final double? width;
  final double? height;

  const IconTemplate({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetPath, fit: fit, width: width, height: height);
  }
}

class ClickableIconTemplate extends IconTemplate {
  final VoidCallback onTap;

  const ClickableIconTemplate({
    super.key,
    required super.assetPath,
    required this.onTap,
    super.fit,
    super.width,
    super.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: super.build(context));
  }
}
