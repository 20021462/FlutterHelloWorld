import 'package:flutter/material.dart';
import 'package:hello_world/back_end/group_money.dart';
import 'package:hello_world/back_end/transaction.dart';
import 'package:intl/intl.dart';
import 'back_end/moma_user.dart';

// ignore: must_be_immutable
class ReportingPage extends StatefulWidget {
  MomaUser appUser;

  ReportingPage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<ReportingPage> createState() => _ReportingPageState();
}

List<String> monthList = <String>[];
DateTime now = DateTime.now();
List<Transaction> transactions = [
  Transaction(83000, DateTime.now(), FOOD, 'Pizza'),
  Transaction(100000, DateTime.now(), GASOLINE_EXPENSES, 'Gas'),
  Transaction(2000000, DateTime.now(), RENT, 'Rent'),
  Transaction(12000000, DateTime.now(), SALARY, 'Salary'),
  Transaction(60000, DateTime.now(), HOSPITAL, 'Hospital'),
  Transaction(700000, DateTime.now(), EDUCATION, ''),
  Transaction(100000, DateTime.now(), PETS, ''),
  Transaction(320000, DateTime.now(), SPORTS, ''),
  Transaction(230000, DateTime.now(), BILLS, ''),
];

class _ReportingPageState extends State<ReportingPage> {
  String monthChoosen = monthList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 64,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: DropdownButton(
                  alignment: AlignmentDirectional.center,
                  iconSize: 35,
                  underline: const SizedBox(),
                  elevation: 3,
                  icon: const Icon(
                    Icons.expand_more,
                    color: Color(0xFF7F3DFF),
                  ),
                  value: monthChoosen,
                  onChanged: (value) {
                    setState(() {
                      monthChoosen = value;
                    });
                  },
                  items: monthList.map((month) {
                    return DropdownMenuItem(
                      alignment: Alignment.center,
                      value: month,
                      child: Text(
                        month,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  color: Colors.black,
                  icon: const Icon(
                    Icons.filter_list,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEE5FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'See your financial report',
                              style: TextStyle(
                                color: Color(0xFF7F3DFF),
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xFF7F3DFF)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // ignore: sdk_version_ui_as_code
                  ...transactions.map(
                    (transaction) {
                      return Container(
                        height: 110,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color:
                                    groupMoneyList[transaction.getGroupMoney()]
                                        .background,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                groupMoneyList[transaction.getGroupMoney()]
                                    .icon,
                                color:
                                    groupMoneyList[transaction.getGroupMoney()]
                                        .color,
                                size: 40,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    groupMoneyList[transaction.getGroupMoney()]
                                        .name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    transaction.getNote(),
                                    style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  groupMoneyList[transaction.getGroupMoney()]
                                              .type ==
                                          'OUTCOME'
                                      ? Text(
                                          '- ${NumberFormat("#,###").format(transaction.getMoney())}đ',
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        )
                                      : Text(
                                          '+ ${NumberFormat("#,###").format(transaction.getMoney())}đ',
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                  Text(
                                    DateFormat.Hm()
                                        .format(transaction.getTime()),
                                    style: const TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
          ],
        ));
  }
}
