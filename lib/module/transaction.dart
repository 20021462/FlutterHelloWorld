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
    money = money;
  }

  void setGroupMoney(int groupMoney) {
    category = groupMoney;
  }

  void setNote(String note) {
    note = note;
  }

  void setTime(DateTime time) {
    time = time;
  }

  bool less(Transaction other) {
    return time.isBefore(other.getTime());
  }

  String show() {
    return "id = $index\nmoney = $money\ntime = $DateTime\ncategory = ${categoryList[this.category].name}\nnote = $note";
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
