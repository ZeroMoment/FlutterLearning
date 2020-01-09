
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/module/animation/stagger_animation.dart';

class AnimationStaggerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationStaggerPageState();
  }
}

class _AnimationStaggerPageState extends State<AnimationStaggerPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    );
  }

  Future<Null> _playAnimation() async {
    try{
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stagger AniPage"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 500.0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                )
            ),
            child: StaggerAnimation(controller: _controller,),
          ),
        ),
      ),
    );
  }

}