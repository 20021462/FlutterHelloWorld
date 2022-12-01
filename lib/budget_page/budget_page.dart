import 'package:flutter/material.dart';

import '../module/moma_user.dart';
import 'budget_page_view.dart';
import '../../design_system.dart';

// ignore: must_be_immutable
class BudgetPage extends StatefulWidget {
  final MomaUser appUser;
  const BudgetPage({Key key, this.appUser}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  DateTime date = DateTime.now();
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  DateTime dateCount(DateTime dateTime, int index) {
    int newTimeMonth = dateTime.month - index;
    int newTimeYear = dateTime.year;
    while (newTimeMonth <= 0) {
      newTimeMonth += 12;
      newTimeYear -= 1;
    }
    return DateTime(newTimeYear, newTimeMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          child: FloatingActionButton(
            child: const Text(
              "Add",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ),
      ),
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
                pageController.animateToPage(pageChanged,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear);
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
                  pageController.animateToPage(pageChanged,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear);
                });
              },
            )
          ],
          centerTitle: true,
          title: Text(
            '${dateCount(date, pageChanged).month}/${dateCount(date, pageChanged).year}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: mainColor,
        child: Column(
          children: [
            // Container(
            //   height: 150,
            // ),
            const SizedBox(
              height: 150,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(45)),
                    color: Colors.white,
                  ),
                  child: PageView.builder(
                    reverse: true,
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        pageChanged = index;
                        pageController.animateToPage(pageChanged,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear);
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return BudgetPageView(
                        dateTime: dateCount(date, pageChanged),
                        appUser: widget.appUser,
                      );
                    },
                    itemCount: 10,
                  )),
            ),
            // Container(
            //   decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Colors.white),
            //   width: double.infinity,
            //   padding: EdgeInsets.only(left: 20,right: 20,bottom: 40),
            //   child: buildButton("Create a budget", sizeType2, colorType1,() {},),
            //
            // )
          ],
        ),
      ),
    );
  }
}
/*

),*/
