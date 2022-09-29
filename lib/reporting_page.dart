import 'package:flutter/material.dart';

import 'back_end/moma_user.dart';

// ignore: must_be_immutable
class ReportingPage extends StatefulWidget {
  MomaUser appUser;

  ReportingPage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<ReportingPage> createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Elevated Button",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '$count',
            style: const TextStyle(fontSize: 120),
          ),
          ElevatedButton(
            child: const Text("+ 1"),
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
