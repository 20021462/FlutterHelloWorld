import 'package:flutter/material.dart';
import 'package:hello_world/adding_page.dart';
import 'package:hello_world/budget_page.dart';
import 'package:hello_world/profile_page/profile_page.dart';
import 'package:hello_world/reporting_page.dart';
import 'package:hello_world/transaction_page.dart';
import 'module/moma_user.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  MomaUser appUser;

  HomePage({Key key, this.appUser}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePageState(appUser);
}

class _HomePageState extends State<HomePage> {
  MomaUser appUser;

  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;

  _HomePageState(this.appUser) {
    currentScreen = TransactionPage(
      appUser: appUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              currentScreen = AddingPage(appUser: appUser);
              currentTab = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen = TransactionPage(appUser: appUser);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen = ReportingPage(appUser: appUser);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swap_horiz_rounded,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Reporting",
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              //Right tab button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen = BudgetPage(appUser: appUser);
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.savings,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Planning",
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage(appUser: appUser);
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 4 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                            color: currentTab == 4 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
