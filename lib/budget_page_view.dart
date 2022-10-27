import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'back_end/moma_user.dart';
import 'package:hello_world/back_end/group_money.dart';

import '../design_system.dart';

// ignore: must_be_immutable
class BudgetPageView extends StatefulWidget {
  DateTime dateTime;
  MomaUser appUser;

  BudgetPageView({Key key,this.dateTime,this.appUser}) : super(key: key);

  @override
  State<BudgetPageView> createState() => _BudgetPageViewState();

}

class _BudgetPageViewState extends State<BudgetPageView> {
  String categoryDropDownValue = groupMoneyList[0].name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          buildButton("Create a budget", sizeType2,() {})
        ],
      ),
    );
  }
}