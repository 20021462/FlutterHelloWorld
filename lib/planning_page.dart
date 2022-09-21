import 'package:flutter/material.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List<bool> _isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ToggleButtons",
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 30,
        ),
        ToggleButtons(
          children: <Widget>[
            Icon(Icons.highlight_rounded),
            Icon(Icons.bluetooth),
            Icon(Icons.wifi),
          ],
          isSelected: _isSelected,
          onPressed: (int index) {
            setState(() {
              _isSelected[index] = !_isSelected[index];
            });
          },
        ),
      ],
    ));
  }
}
