import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_learning/route/routes.dart' as mRoutes;

// ignore: must_be_immutable
class ChannelViewControlPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ControlPageState();
  }
}

class _ControlPageState extends State<ChannelViewControlPage> {
  NativeViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = NativeViewController();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Conrol View Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            child: SampleView(controller: _controller,),
          ),
          RaisedButton(
            onPressed: () {
              print('事件tap native.....');
              _controller.changeBackgroundColor();
            },
            child: Text('change color'),)
        ],
      ),
    );
  }

}

class NativeViewController {
  MethodChannel _channel;

  onCreate(int id) {
    _channel = MethodChannel('test.lzm/sample_views_$id');
  }

  Future<void> changeBackgroundColor() async {
    return _channel.invokeMethod('changeBgColor');
  }
}

class SampleView extends StatefulWidget {
  final NativeViewController controller;
  const SampleView({
    Key key,
    this.controller
}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _SampleViewState();
  }
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'test.lzm/sampleView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return Center(
        child: Text('ios channel 待开发'),
      );
    }
  }

  _onPlatformViewCreated(int id) {
    print('原生传入id：$id');
    if(widget.controller == null) {
      return;
    }

    widget.controller. onCreate(id);
  }
}
