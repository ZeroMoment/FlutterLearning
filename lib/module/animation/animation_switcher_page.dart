

import 'package:flutter/material.dart';
import 'package:flutter_learning/module/animation/page_slide_transition.dart';
import 'package:flutter_learning/module/animation/slide_transition_x.dart';

class AnimationSwitcherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationSwitcherPageState();
  }
}

class _AnimationSwitcherPageState extends State {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Switcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.down, //上入下出
                  position: animation,
                );
//                return MySlideTransition(child: child, postion: tween.animate(animation),);
//                return ScaleTransition(child: child, scale: animation,);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('+1'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}