import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'back_end/moma_user.dart';

class TransactionPage extends StatefulWidget {
  MomaUser appUser;

  TransactionPage({Key key,MomaUser appUser}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Icon button",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 120),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
              ),
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

