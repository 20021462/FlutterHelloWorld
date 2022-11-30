import 'package:hello_world/module/transaction.dart';

import 'group_money.dart';

class MomaUser {
  String gmail;
  List<Transaction> transactions;
  // ignore: non_constant_identifier_names
  int MAX_ID = 0;
  double currentMoney = 0;
  double totalIncome = 0;
  double totalOutcome = 0;
  String uid = "";

  MomaUser(this.gmail) {
    transactions = <Transaction>[];
  }

  List<Transaction> getTransactionList() {
    return transactions;
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
    print("add successfully");
    newTransaction.setID(MAX_ID++);

    if (categoryList[newTransaction.getGroupMoney()].type == INCOME) {
      totalIncome += newTransaction.getMoney();
    } else {
      totalOutcome += newTransaction.getMoney();
    }
    currentMoney = totalIncome-totalOutcome;

    if (isTransactionEmpty()) {
      transactions.add(newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    if (transactions[0].after(newTransaction)) {
      transactions.insert(0, newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    int length = transactions.length;
    if (newTransaction.after(transactions[length - 1])) {
      transactions.add(newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    for (int i = 0; i < length - 1; i++) {
      if (newTransaction.after(transactions[i]) &&
          transactions[i + 1].after(newTransaction)) {
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
    print("number of transactions:${transactions.length}");
    for (Transaction i in transactions) {
      // ignore: avoid_print
      print(i.info());
    }
  }
}
