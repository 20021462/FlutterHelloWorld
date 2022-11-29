import 'package:flutter/material.dart';
import 'package:hello_world/adding_page.dart';
import 'package:hello_world/budget_page/budget_page.dart';
import 'package:hello_world/profile_page/profile_page.dart';
import 'package:hello_world/transaction_page.dart';
import 'package:hello_world/home_page.dart';
import 'module/group_money.dart';
import 'module/moma_user.dart';
import 'module/transaction.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  MomaUser appUser;

  MainPage({Key key, this.appUser}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MainPage> createState() => _MainPageState(appUser);
}

class _MainPageState extends State<MainPage> {

  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;
  List<StatefulWidget> screens;

  _MainPageState(MomaUser appUser){
    screens = [
      HomePage(appUser: appUser,),
      TransactionPage(appUser: appUser),
      AddingPage(appUser: appUser),
      BudgetPage(appUser: appUser),
      ProfilePage(appUser: appUser),
    ];
    currentScreen = screens[0];
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
              currentTab = 2;
              currentScreen = screens[currentTab];

            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: Colors.white,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                        currentScreen = screens[currentTab];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
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
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                        currentScreen = screens[currentTab];
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
                          "Transaction",
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                        currentScreen = screens[currentTab];

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
                        currentTab = 4;
                        currentScreen = screens[currentTab];

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
