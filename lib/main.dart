import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {

          }
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Learning Home Page'),
    );
  }
}

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
         ..add("Event");

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

    } else if("Event" == itemTxt) { //事件page

    }
  }
}
