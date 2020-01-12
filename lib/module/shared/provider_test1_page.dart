import 'package:flutter/material.dart';
import 'package:flutter_learning/model/counter_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_learning/route/routes.dart' as mRoutes;

class ProviderTest1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Test1 Page'),
      ),
      body: Center(
        child: Text(
          'Value:${_counter.value}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, mRoutes.sharedProvider2Page),
        child: Icon(Icons.navigate_next),
      ),
    );
  }

}