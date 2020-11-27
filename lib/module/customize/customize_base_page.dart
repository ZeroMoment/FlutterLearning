import 'package:flutter/material.dart';
import 'package:flutter_learning/cuswidget/gradient_button.dart';
import 'package:flutter_learning/cuswidget/turn_box.dart';

class CustomizeBasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomizeBaseState();
  }
}

class _CustomizeBaseState extends State<CustomizeBasePage> {
  double _turnsOne = .0;
  double _turnsTwo = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件-基础类"),
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Column(
      children: [
        GradientButton(
          colors: [Colors.green, Colors.blue, Colors.yellow],
          height: 50.0,
          child: Text("one"),
          onPressed: onTap1,
        ),
        GradientButton(
          colors: [Colors.lightBlue, Colors.green],
          height: 50.0,
          child: Text("two"),
          onPressed: onTap2,
        ),
        GradientButton(
          colors: [Colors.lightGreen[300], Colors.greenAccent],
          height: 50.0,
          child: Text("three"),
          onPressed: onTap3,
        ),
        SizedBox(
          height: 20,
        ),
        TurnBox(
          turns: _turnsOne,
          speed: 500,
          child: Icon(
            Icons.cake,
            size: 50,
          ),
        ),
        TurnBox(
          turns: _turnsTwo,
          speed: 500,
          child: Icon(
            Icons.art_track,
            size: 50,
          ),
        ),
        RaisedButton(
          child: Text("顺时针旋转1/5圈"),
          onPressed: () {
            setState(() {
              _turnsOne += .2;
            });
          },
        ),
        RaisedButton(
          child: Text("逆时针旋转1/5圈"),
          onPressed: () {
            setState(() {
              _turnsTwo -= .2;
            });
          },
        )
      ],
    );
  }

  onTap1() {
    print("111 btn click");
  }

  onTap2() {
    print("222 btn click");
  }

  onTap3() {
    print("333 btn click");
  }
}
