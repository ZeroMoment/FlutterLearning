import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

class AnimationBasePage extends StatefulWidget {
  final testTxt;

  const AnimationBasePage({Key key, this.testTxt}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatinBasePageState();
  }

}

class _AnimatinBasePageState extends State<AnimationBasePage> {

  bool isDataInited = false;
  List<String> _list = List();

  @override
  void initState() {
    super.initState();
    print("base-arg:${widget.testTxt}");

    _list..add("scale_ani")
         ..add("hero_ani")
         ..add("stagger_ani")
         ..add("switcher_ani")
         ..add("widget_ani");
    setState(() {
      isDataInited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Base"),
      ),
       body: isDataInited ?
    ListView.builder(
    itemCount: _list.length,
        itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]),
            onTap: () {
              _tapItem(_list[index]);
            },
          );
        }
    ) : Center(
    child: Text("加载中..."),
    ),
    );
  }

  void _tapItem(String itemTxt) {
    if("scale_ani" == itemTxt) { //动画page
      Map argMap = Map();
      argMap["test_title"] = "11111";
      argMap["test_sub"] = "22222";
      Navigator.pushNamed(context, mRoutes.animationScalePage, arguments: argMap);
    } else if ("hero_ani" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.aniHeroAPage);
    } else if("stagger_ani" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.aniStaggerPage);
    } else if("switcher_ani" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.aniSwitcherPage);
    } else if("widget_ani" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.aniWidgetPage);
    }
  }
}