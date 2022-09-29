import 'package:flutter/material.dart';

import 'back_end/moma_user.dart';

// ignore: must_be_immutable
class PlanningPage extends StatefulWidget {
  MomaUser appUser;

  PlanningPage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  final List<bool> _isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "ToggleButtons",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          ToggleButtons(
            isSelected: _isSelected,
            onPressed: (int index) {
              setState(() {
                _isSelected[index] = !_isSelected[index];
              });
            },
            children: const <Widget>[
              Icon(Icons.highlight_rounded),
              Icon(Icons.bluetooth),
              Icon(Icons.wifi),
            ],
          ),
        ],
      ),
    );
  }
}
