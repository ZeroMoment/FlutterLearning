

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_learning/module/animation/animation_base_page.dart';
import 'package:flutter_learning/module/animation/animation_hero_a_page.dart';
import 'package:flutter_learning/module/animation/animation_hero_b_page.dart';
import 'package:flutter_learning/module/animation/animation_stagger_page.dart';

import '../home_learning.dart';

final String home = '/';

final String animationBasePage = '/AnimationBasePage';
final String animationScalePage = '/AnimationScalePage';
final String aniHeroAPage = '/AniHeroAPage';
final String aniHeroBPage = '/AniHeroBPage';
final String aniStaggerPage = '/AniStaggerBPage';

// 配置路由命名信息
final routes = {
  home: (context) => MyHomePage(title: 'Flutter Learning Home Page'),
  animationBasePage: (context) => AnimationBasePage(testTxt: ModalRoute.of(context).settings.arguments,),
//  animationScalePage: (context) { 单独设置了路由过渡，不需要在这处理，onGenerateRoute
//    Map arguments = ModalRoute.of(context).settings.arguments;
//    return AnimationScalePage(
//      testTitle: arguments["test_title"],
//      testSub: arguments["test_sub"],
//    );
//  },
   aniHeroAPage: (context) => AnimationHeroAPage(),
   aniHeroBPage: (context) => AnimationHeroBPage(),
   aniStaggerPage: (context) => AnimationStaggerPage(),

};

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转错误'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "页面不存在",
          style: TextStyle(color: Colors.grey, fontSize: 28.0),
        ),
      ),
    );
  }
}