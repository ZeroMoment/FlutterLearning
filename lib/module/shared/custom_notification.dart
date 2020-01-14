import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  final String msg;

  CustomNotification(this.msg);
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => CustomNotification('Hi notification').dispatch(context),
      child: Text("Fire Notification"),
    );
  }
}