import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  int _initvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Slider",
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '$_initvalue',
          style: TextStyle(fontSize: 120),
        ),
        Slider(
          value: _initvalue.toDouble(),
          min: 0,
          max: 100,
          divisions: 10,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          //label: 'Set value',
          onChanged: (double newValue) {
            setState(() {
              _initvalue = newValue.round();
            });
          },
        )
      ],
    ));
  }
}
