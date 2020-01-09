
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationHeroBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero B Page"),
      ),
      body: Center(
        child: Hero(tag: "hero_test",
          child: Image.asset("appsource/good.jpg",),
        ),
      ),
    );
  }

}