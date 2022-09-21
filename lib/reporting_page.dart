import 'dart:developer';

import 'package:flutter/material.dart';

class ReportingPage extends StatefulWidget {
  const ReportingPage({Key key}) : super(key: key);

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
        Text(
          "Elevated Button",
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '$count',
          style: TextStyle(fontSize: 120),
        ),
        ElevatedButton(
          child: Text("+ 1"),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    ));
  }
}
