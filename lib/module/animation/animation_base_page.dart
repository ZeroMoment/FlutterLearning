import 'package:flutter/material.dart';

class AnimationBasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatinBasePageState();
  }

}

class _AnimatinBasePageState extends State<AnimationBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Base"),
      ),

    );
  }
}