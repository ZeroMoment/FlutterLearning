

import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {

  final int data; //需要在子树中共享的数据，本例保存点击次数

  ShareDataWidget({
    @required this.data,
    Widget child
}) : super(child:child);

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

}