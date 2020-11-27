
import 'package:flutter/material.dart';

///旋转子控件，带过渡动画
class TurnBox extends StatefulWidget {

  final double turns; //旋转的“圈”数,一圈为360度，如0.25圈即90度
  final int speed; //过渡动画执行的总时长 毫秒
  final Widget child;

  const TurnBox({Key key, this.turns = .0, this.speed = 200, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }

}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if(oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed??200),
        curve: Curves.easeOut
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}