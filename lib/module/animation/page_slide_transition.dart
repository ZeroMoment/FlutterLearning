import 'package:flutter/material.dart';

class MySlideTransition extends AnimatedWidget {
  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  MySlideTransition({
    Key key,
    @required Animation<Offset> postion,
    this.transformHitTests = true,
    this.child,
  })  : assert(postion != null),
        super(key: key, listenable: postion);

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
