import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/account_page%20copy.dart';
import 'package:hello_world/adding_page.dart';
import 'package:hello_world/planning_page.dart';
import 'package:hello_world/reporting_page.dart';
import 'package:hello_world/transaction_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final screens = [
    TransactionPage(),
    ReportingPage(),
    AddingPage(),
    PlanningPage(),
    AccountPage(),
  ];

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            color: Colors.black,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            items: const [
              Icon(
                Icons.account_balance_wallet,
                size: 30,
              ),
              Icon(
                Icons.bar_chart,
                size: 30,
              ),
              Icon(
                Icons.add,
                size: 30,
              ),
              Icon(
                Icons.savings,
                size: 30,
              ),
              Icon(
                Icons.person,
                size: 30,
              ),
            ],
            onTap: _changeItem,
            index: _index,
          ),
        ));
  }

  void _changeItem(int value) {
    setState(() {
      _index = value;
    });
  }
}
