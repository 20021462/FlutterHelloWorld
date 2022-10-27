import 'package:flutter/material.dart';

import 'back_end/moma_user.dart';
import 'budget_page_view.dart';
import '../design_system.dart';

// ignore: must_be_immutable
class BudgetPage extends StatefulWidget {
  MomaUser appUser;
  BudgetPage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  DateTime date = DateTime.now();
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  DateTime dateCount(DateTime dateTime, int index){
    int newTimeMonth=dateTime.month-index;
    int newTimeYear = dateTime.year;
    while(newTimeMonth<=0){
      newTimeMonth+=12;
      newTimeYear-=1;
    }
    return DateTime(newTimeYear,newTimeMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 150,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                pageChanged++;
              });
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  pageChanged--;
                });
              },
            )
          ],
          centerTitle: true,
          title: Text(
            '${dateCount(date, pageChanged).month}/${dateCount(
                date, pageChanged).year}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: mainColor,
        child: Column(
          children: [
            Container(
              height: 150,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: PageView.builder(
                    reverse: true,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        pageChanged = index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return BudgetPageView(dateTime: dateCount(date, index),
                        appUser: widget.appUser,);
                    },
                    itemCount: 10,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

),*/
