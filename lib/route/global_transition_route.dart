
import 'package:flutter/material.dart';


class GlobalTransitionRoute extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      child: child,
    );
  }

}