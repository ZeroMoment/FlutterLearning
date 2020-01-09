import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute(this.page)
      : super(
            pageBuilder: (context, animation, secondaryAnimation) {
              return page;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                alignment: Alignment.topRight,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut)),
                child: child,
              );
            },
            transitionDuration: Duration(seconds: 1));
}
