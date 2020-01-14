
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChannelTestPageState();
  }

}

const platform = MethodChannel('test.lzm/utils');

class _ChannelTestPageState extends State<ChannelTestPage> {


  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MethodChannel Test Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('progress:$result'),
          RaisedButton(
            onPressed: handleButtonClick,
            child: Text('update from platform'),
          )
        ],
      ),
    );
  }

  handleButtonClick() async {
    try{
      result = await platform.invokeMethod('updateProgress');
    } catch (e) {
      result = -1;
    }

    print("platform back resul:$result");
    setState(() {
    });
  }

}