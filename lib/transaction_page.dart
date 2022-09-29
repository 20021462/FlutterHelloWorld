import 'package:flutter/material.dart';
import 'back_end/moma_user.dart';

// ignore: must_be_immutable
class TransactionPage extends StatefulWidget {
  MomaUser appUser;

  TransactionPage({Key key, MomaUser appUser}) : super(key: key);

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
          const Text(
            "Icon button",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '$count',
            style: const TextStyle(fontSize: 120),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
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
