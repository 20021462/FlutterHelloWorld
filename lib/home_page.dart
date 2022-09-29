import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/adding_page.dart';
import 'package:hello_world/planning_page.dart';
import 'package:hello_world/reporting_page.dart';
import 'package:hello_world/transaction_page.dart';
import 'account_page.dart';
import 'back_end/moma_user.dart';

class HomePage extends StatefulWidget {
  MomaUser appUser;

  HomePage({Key key, this.appUser}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(appUser);
}

class _HomePageState extends State<HomePage> {
  MomaUser appUser;

  int currentTab = 0;
  final PageStorageBucket bucket =PageStorageBucket();
  Widget currentScreen;

  _HomePageState(this.appUser){
    currentScreen=TransactionPage(appUser: appUser,);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            currentScreen=AddingPage(appUser: appUser,);
            currentTab=2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 90,
                    onPressed: (){
                      setState(() {
                        currentScreen=TransactionPage(appUser: appUser,);
                        currentTab =0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: currentTab==0? Colors.blue:Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: currentTab==0? Colors.blue: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: (){
                      setState(() {
                        currentScreen=ReportingPage(appUser: appUser,);
                        currentTab =1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart,
                          color: currentTab==1? Colors.blue:Colors.grey,
                        ),
                        Text(
                          "Reporting",
                          style: TextStyle(color: currentTab==1? Colors.blue: Colors.grey),
                        )
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
                    onPressed: (){
                      setState(() {
                        currentScreen=PlanningPage(appUser: appUser,);
                        currentTab =3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.savings,
                          color: currentTab==3? Colors.blue:Colors.grey,
                        ),
                        Text(
                          "Planning",
                          style: TextStyle(color: currentTab==3? Colors.blue: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: (){
                      setState(() {
                        currentScreen=AccountPage(appUser: appUser,);
                        currentTab =4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab==4? Colors.blue:Colors.grey,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(color: currentTab==4? Colors.blue: Colors.grey),
                        )
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
