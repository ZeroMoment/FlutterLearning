import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_learning/route/routes.dart' as mRoutes;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _list = List();

  StreamController<int> cr = new StreamController();
  int _clickCount = 0;

  StreamController<int> cr2 = new StreamController();
  final st = StreamTransformer<int, String>.fromHandlers(
    handleData: (int data, sink) {
      if(data == 20) {
        sink.add('添加正常');
      } else {
        sink.addError('添加错误');
      }
    }
  );

  StreamController<int> cr3 = new StreamController();

  @override
  void initState() {
    super.initState();
    print("init state......");

    _testStream();
    _stream();

    _list..add("Animation")
      ..add("Shared")
      ..add("MethodChannel")
      ..add("customize")
      ..add("TestBuild")
    ;

  }

  void _testStream() {
    cr.stream.listen((data) {
      debugPrint('点击：$data');
    });

    cr2.stream.transform(st).listen((String data){
      debugPrint(data);
    }).onError((e){
      debugPrint('$e');
    });

    cr2.sink.add(11);
    cr2.sink.add(20);
    cr2.close();

    cr3.stream.where((value) {
      return value == 33;
    }).listen((data) {
      debugPrint('data:$data');
    });

    cr3.sink.add(222);
    cr3.sink.add(33);
    cr3.close();


    Stream<String>.fromIterable(['a', 'b', 'c']).listen((data) {
      debugPrint('ite:$data');
    });
  }

  void _stream() async {
    Duration interval = Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (data) => data);
    stream = stream.take(6);
    stream = stream.map((data) => data + 3);
    await for (int i in stream) {
      debugPrint('hehe:$i');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build.......");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
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
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addStearm,
      ),
    );
  }

  void _tapItem(String itemTxt) {
    if("Animation" == itemTxt) { //动画page
      Navigator.pushNamed(context, mRoutes.animationBasePage, arguments: "哈哈一笑");
    } else if("Shared" == itemTxt) { //共享page
      Navigator.pushNamed(context, mRoutes.sharedBasePage).then((result) {
        print("test- result:$result");
      });
    } else if("MethodChannel" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.methodChannelPage);
    } else if("customize" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.customizeBasePage);
    } else if("TestBuild" == itemTxt) {
      Navigator.pushNamed(context, mRoutes.testBuildBasePage);
    }
  }

  void _addStearm() {
    _clickCount++;
    cr.sink.add(_clickCount);
  }

  @override
  void dispose() {
    cr.close();
    super.dispose();
  }
}