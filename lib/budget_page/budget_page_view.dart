import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../module/moma_user.dart';
import '../module/group_money.dart';

import '../../design_system.dart';

// ignore: must_be_immutable
class BudgetPageView extends StatefulWidget {
  DateTime dateTime;
  MomaUser appUser;

  BudgetPageView({Key key, this.dateTime, this.appUser}) : super(key: key);

  @override
  State<BudgetPageView> createState() => _BudgetPageViewState();
}

class _BudgetPageViewState extends State<BudgetPageView> {
  String categoryDropDownValue = categoryList[0].name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child:
      Column(
        children: [

        ],
      ),
      ),
    );
  }
}
