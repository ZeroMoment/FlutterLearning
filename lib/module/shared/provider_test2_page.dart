import 'package:flutter/material.dart';
import 'package:flutter_learning/model/counter_model.dart';
import 'package:provider/provider.dart';

class ProviderTest2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Test2 Page'),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int testSize, _) => Center(
          child: Text(
            'Value:${counter.value}',
            style: TextStyle(fontSize: testSize.toDouble()),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }

}