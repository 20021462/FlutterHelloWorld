import 'package:hello_world/firebase.dart';
import 'package:hello_world/module/transaction.dart';

import 'group_money.dart';

class MomaUser {
  String gmail;
  List<MomaTransaction> transactions;
  // ignore: non_constant_identifier_names
  int MAX_ID = 0;
  double currentMoney = 0;
  double totalIncome = 0;
  double totalOutcome = 0;
  String uid = "";

  MomaUser(this.gmail) {
    transactions = <MomaTransaction>[];
  }

  MomaUser.fullProp(this.uid, this.gmail, this.MAX_ID, this.currentMoney, this.totalIncome, this.totalOutcome){
    transactions = <MomaTransaction>[];
  }


  List<MomaTransaction> getTransactionList() {
    return transactions;
  }

  MomaTransaction removeID(int index) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == index) {
        DatabaseManager.removeTransaction(index);
        if (categoryList[transactions[i].category].type=="INCOME"){
          totalIncome -= transactions[i].getMoney();
          currentMoney-= transactions[i].getMoney();
        } else {
          totalOutcome -= transactions[i].getMoney();
          currentMoney += transactions[i].getMoney();
        }
        return transactions.removeAt(i);
      }
    }
    return null;
  }

  MomaTransaction findID(int index) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == index) {
        return transactions[i];
      }
    }
    return null;
  }

  void addTransaction(MomaTransaction newMomaTransaction) {
    newMomaTransaction.setID(MAX_ID++);

    if (categoryList[newMomaTransaction.getGroupMoney()].type == INCOME) {
      totalIncome += newMomaTransaction.getMoney();
      currentMoney += newMomaTransaction.getMoney();
    } else {
      totalOutcome += newMomaTransaction.getMoney();
      currentMoney -= newMomaTransaction.getMoney();
    }

    DatabaseManager.addTransaction(newMomaTransaction);
    DatabaseManager.updateProperty(this);

    if (isTransactionEmpty()) {
      transactions.add(newMomaTransaction);
      //updateMomaTransaction(transactions, uid);
      return;
    }

    if (transactions[0].after(newMomaTransaction)) {
      transactions.insert(0, newMomaTransaction);
      //updateMomaTransaction(transactions, uid);
      return;
    }

    int length = transactions.length;
    if (newMomaTransaction.after(transactions[length - 1])||newMomaTransaction.equal(transactions[length-1])) {
      transactions.add(newMomaTransaction);
      //updateMomaTransaction(transactions, uid);
      return;
    }

    for (int i = 0; i < length - 1; i++) {
      if (newMomaTransaction.after(transactions[i]) &&
          transactions[i + 1].after(newMomaTransaction)) {
        transactions.insert(i + 1, newMomaTransaction);
        //updateMomaTransaction(transactions, uid);
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

  Map<String,dynamic> toJson() => {
    'uid': uid,
    'gmail': gmail,
    'max transaction id': MAX_ID,
    'current money': currentMoney,
    'total income': totalIncome,
    'total outcome': totalOutcome
  };

  static MomaUser fromJson(Map<String, dynamic> json) => MomaUser.fullProp(
      json['uid'],
      json['gmail'],
      json['max transaction id'],
      json['current money'],
      json['total income'],
      json['total outcome'],
  );

  void showTransactions() {
    for (MomaTransaction i in transactions) {
      // ignore: avoid_print
      print(i.info());
    }
  }
}
