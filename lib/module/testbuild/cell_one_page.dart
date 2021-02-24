
import 'package:flutter/material.dart';

class CellOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CellOne -build ....");
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text("Cell-One"),
    );
  }

}