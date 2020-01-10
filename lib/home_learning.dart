import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isDataInited = false;
  List<String> _list = List();

  @override
  void initState() {
    super.initState();
    print("init state......");
    _list..add("Animation")
      ..add("Shared");

    setState(() {
      isDataInited = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build.......");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        )
    );
  }

  void _tapItem(String itemTxt) {
    if("Animation" == itemTxt) { //动画page
      Navigator.pushNamed(context, mRoutes.animationBasePage, arguments: "哈哈一笑");
    } else if("Shared" == itemTxt) { //共享page
      Navigator.pushNamed(context, mRoutes.sharedBasePage);
    }
  }
}