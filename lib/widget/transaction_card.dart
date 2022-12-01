import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../module/group_money.dart';
import '../module/transaction.dart';

class TransactionCard extends StatelessWidget {
  final MomaTransaction transaction;
  const TransactionCard({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        borderRadius: BorderRadius.circular(30),
      ),
      child:  Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: categoryList[transaction.getGroupMoney()].background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              categoryList[transaction.getGroupMoney()].icon,
              color: categoryList[transaction.getGroupMoney()].color,
              size: 40,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryList[transaction.getGroupMoney()].name,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                categoryList[transaction.getGroupMoney()].type == 'OUTCOME'
                    ? Text(
                        '- \$${NumberFormat("#,###.##").format(transaction.getMoney())}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      )
                    : Text(
                        '+ \$${NumberFormat("#,###.##").format(transaction.getMoney())}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                Text(
                  DateFormat.Hm().format(transaction.getTime()),
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
  }
}
