import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

class AnimationBasePage extends StatefulWidget {
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
    _list..add("scale_ani")
         ..add("tween_ani");
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
      Navigator.pushNamed(context, mRoutes.animationScalePage);
    }
  }
}