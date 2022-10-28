import 'package:hello_world/module/transaction.dart';

import 'group_money.dart';

class MomaUser {
  String gmail;
  List<Transaction> transactions;
  // ignore: non_constant_identifier_names
  int MAX_ID = 0;
  double currentMoney = 0;
  String uid = "";

  MomaUser(this.gmail) {
    transactions = <Transaction>[];
  }

  Transaction removeID(int index) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == index) {
        return transactions.removeAt(i);
        //updateTransaction(transactions, uid);
      }
    }
    return null;
  }

  Transaction findID(int index) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == index) {
        return transactions[i];
      }
    }
    return null;
  }

  void addTransaction(Transaction newTransaction) {
    newTransaction.setID(MAX_ID++);
    if (groupMoneyList[newTransaction.getGroupMoney()].type == INCOME) {
      currentMoney += newTransaction.getMoney();
    } else {
      currentMoney -= newTransaction.getMoney();
    }

    if (isTransactionEmpty()) {
      transactions.insert(0, newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    if (newTransaction.less(transactions[0])) {
      transactions.insert(0, newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    int length = transactions.length;
    if (transactions[length - 1].less(newTransaction)) {
      transactions.add(newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    for (int i = 0; i < length - 1; i++) {
      if (transactions[i].less(newTransaction) &&
          newTransaction.less(transactions[i + 1])) {
        transactions.insert(i + 1, newTransaction);
        //updateTransaction(transactions, uid);
        return;
      }
    }
  }

  double getCurrentMoney() {
    return currentMoney;
  }

  bool isTransactionEmpty() {
    return transactions.isEmpty;
  }

  void showTransactions() {
    for (Transaction i in transactions) {
      // ignore: avoid_print
      print(i);
    }
  }
}
