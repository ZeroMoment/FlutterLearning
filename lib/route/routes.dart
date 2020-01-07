

import 'package:flutter/material.dart';
import 'package:flutter_learning/module/animation/animation_base_page.dart';
import 'package:flutter_learning/module/animation/animation_scale_page.dart';

import '../home_learning.dart';

final String home = '/';

final String animationBasePage = '/AnimationBasePage';
final String animationScalePage = '/AnimationScalePage';

// 配置路由命名信息
final routes = {
  home: (context) => MyHomePage(title: 'Flutter Learning Home Page'),
  animationBasePage: (context) => AnimationBasePage(),
  animationScalePage: (context) => AnimationScalePage()
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