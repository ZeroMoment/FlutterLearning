import 'package:flutter/material.dart';
import 'package:flutter_learning/module/shared/custom_notification.dart';

class CustomNotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomNotificationPageState();
  }

}

class _CustomNotificationPageState extends State<CustomNotificationPage> {

  String _msg = "通知";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom notification page"),
      ),
      body: NotificationListener<CustomNotification> (
        // ignore: missing_return
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg+"  ";
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_msg),
            CustomChild()
          ],
        ),
      ),
    );
  }
}