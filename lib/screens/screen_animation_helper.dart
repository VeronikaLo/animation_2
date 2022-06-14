import 'package:flutter/material.dart';

//

class SliderRoute extends PageRouteBuilder {
  final Widget widget;

  SliderRoute({required this.widget}) : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation
        ) => widget,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) => SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    ),
  );
}