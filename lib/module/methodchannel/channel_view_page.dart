import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_learning/route/routes.dart' as mRoutes;

const platform = MethodChannel('test.lzm/channel_views');

class ChannelViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channel View Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300.0,
            height: 300.0,
            child: _creatChannelView(),
          ),
          RaisedButton(
            onPressed: () {
              print('事件tap native.....');
              Navigator.popUntil(context, ModalRoute.withName(mRoutes.home));
            },
            child: Text('pop until home'),)
        ],
      ),
    );
  }

  Widget _creatChannelView() {
    if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'channelView');
    } else {
      return Center(
        child: Text('ios channel 待开发'),
      );
    }
  }
}
