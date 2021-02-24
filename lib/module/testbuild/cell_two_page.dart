
import 'package:flutter/material.dart';

class CellTwoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CellTwoState();
  }

}

class _CellTwoState extends State<CellTwoPage> {
  @override
  void initState() {
    print("CellTwo -initState ....");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("CellTwo -build ....");
    return Column(
      children: [
        Container(
          height: 60,
          alignment: Alignment.center,
          child: Text("Cell-Two"),
        ),
        FlatButton(onPressed: (){
          setState(() {
          });
        }, child: Text('cell_two_refresh'))
      ],
    );
  }

}