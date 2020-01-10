import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

class SharedBasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedBasePageState();
  }

}

class _SharedBasePageState extends State<SharedBasePage> {

  bool isDataInited = false;
  List<String> _list = List();

  @override
  void initState() {
    super.initState();
    _list..add("shared_inherited")
         ..add("shared_provider");
    setState(() {
      isDataInited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Base"),
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
    if("shared_inherited" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.sharedInheritedPage);
    } else if("shared_provider" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.aniWidgetPage);
    }
  }
}