import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/success.svg',
      fit: BoxFit.contain,
      width: 166,
      height: 166,
    );
  }
}
