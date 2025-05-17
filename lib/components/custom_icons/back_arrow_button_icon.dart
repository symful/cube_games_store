import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackArrowButtonIcon extends StatelessWidget {
  const BackArrowButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(IconlyLight.arrow_left_circle),
      onPressed: () {
        Navigator.pop(context);
      },
      iconSize: 42,
    );
  }
}
