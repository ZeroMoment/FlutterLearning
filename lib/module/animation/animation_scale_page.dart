import 'package:flutter/material.dart';

class AnimationScalePage extends StatefulWidget {
  final testTitle;
  final testSub;

  const AnimationScalePage({Key key, this.testTitle, this.testSub}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AniamtionScalePageState();
  }
}

class _AniamtionScalePageState extends State<AnimationScalePage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    print("scale-arg:${widget.testTitle}---${widget.testSub}");

    controller = new AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this
    );

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    //图片高度从0变成300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation); //controller
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画（正向执行）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("animatoin   ... build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Scale Animation Page'),
      ),
      //AnimatedImage(animation: animation,)
      body: GrowTransition(
        child: Container(color: Colors.red,),
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        color: Colors.red,
        width: animation.value,
        height: animation.value,
      ),
    );
  }

}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext ctx, Widget child) {
          return Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

}