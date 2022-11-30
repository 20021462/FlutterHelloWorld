import 'dart:core';

import 'package:hello_world/module/group_money.dart';

class Transaction {
  int index;
  double money;
  DateTime time;
  int category;
  String note;

  Transaction(this.money, this.time, this.category, this.note) {
    index = -1;
  }

  int getID() {
    return index;
  }

  double getMoney() {
    return money;
  }

  int getGroupMoney() {
    return category;
  }

  String getNote() {
    return note;
  }

  DateTime getTime() {
    return time;
  }

  void setID(int index) {
    this.index = index;
  }

  void setMoney(double money) {
    this.money = money;
  }

  void setGroupMoney(int groupMoney) {
    category = groupMoney;
  }

  void setNote(String note) {
    this.note = note;
  }

  void setTime(DateTime time) {
    time = time;
  }

  bool after(Transaction other) {
    return time.compareTo(other.getTime()) >= 0;
  }

  String info() {
    return "id = $index\nmoney = $money\ntime = $time\ncategory = ${categoryList[category].name}\nnote = $note";
  }

  @override
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Transaction) {
      if (other.getMoney() == getMoney()) {
        return true;
      }
    }
    return false;
  }
}
