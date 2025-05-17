import 'package:flutter/material.dart';

void pushPage(BuildContext context, WidgetBuilder pageBuilder) {
  Navigator.of(context).push(createRoute(pageBuilder));
}

void replacePage(BuildContext context, WidgetBuilder pageBuilder) {
  Navigator.of(context).pushReplacement(createRoute(pageBuilder));
}

Route createRoute(WidgetBuilder pageBuilder) {
  return PageRouteBuilder(
    pageBuilder:
        (context, animation, secondaryAnimation) => pageBuilder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
