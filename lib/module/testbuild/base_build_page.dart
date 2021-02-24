
import 'package:flutter/material.dart';
import 'package:flutter_learning/module/testbuild/cell_one_page.dart';
import 'package:flutter_learning/module/testbuild/cell_two_page.dart';

class BaseBuildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("basebuild......000");
    return Scaffold(
      appBar: AppBar(
        title: Text('baseBuildPage'),
      ),
      body: OnePage(),
    );
  }

}

class OnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnePaegState();
  }

}

class _OnePaegState extends State<OnePage> {

  var curNum = 22;

  @override
  void initState() {
    print("onepage- initstate......");
    curNum = 33;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("onepage -build ......111");
    return Column(
      children: [
        Text("当前数字：$curNum"),
        SizedBox(height: 10,),
        CellOnePage(),
        SizedBox(height: 10,),
        CellTwoPage(),
        FlatButton(onPressed: (){
          setState(() {
            curNum++;
          });
        }, child: Text('base_state_refresh'))
      ],
    );
  }

}