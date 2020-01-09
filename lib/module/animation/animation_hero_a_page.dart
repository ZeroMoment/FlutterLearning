
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_learning/route/routes.dart' as mRoutes;

class AnimationHeroAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(tag: "hero_test", child: ClipOval(
            child: Image.asset("appsource/good.jpg", width: 50.0,),
          )),
          onTap: () {
            Navigator.pushNamed(context, mRoutes.aniHeroBPage);
          },
        ),
      ),
    );
  }

}