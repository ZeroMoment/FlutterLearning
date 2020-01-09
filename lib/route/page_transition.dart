import 'dart:math';
import 'package:flutter/material.dart';

enum TransitionType {
  fade,
  scale,
  rotate,
  transform
}

class PageTransition extends PageRouteBuilder {
  PageTransition(TransitionType type, Widget page, {Duration time = const Duration(milliseconds: 800)})
      : super(
    pageBuilder: (
        context,
        animation,
        secondaryAnimation,
        ) {
      return page;
    },
    transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
        ) {
      switch (type) {
        case TransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
          break;
        case TransitionType.scale:
          return ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
          break;
        case TransitionType.rotate:
          return RotationTransition(
            turns: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInBack,
            ),
            child: child,
          );
          break;
        case TransitionType.transform:
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0001)
              ..rotateX(animation.value * pi * 2)
              ..rotateY(animation.value * pi * 2),
            alignment: FractionalOffset.center,
            child: child,
          );
          break;
        default:
          return child;
      }
    },
    transitionDuration: time,
  );
}
