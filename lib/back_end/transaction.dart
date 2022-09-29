import 'dart:core';
import 'group_money.dart';

class Transaction {
  int _index;
  int _money;
  DateTime _time;
  int _groupMoney;
  String _note;

  Transaction(this._money, this._time, this._groupMoney, this._note) {
    _index = -1;
  }
  int getID() {
    return _index;
  }

  int getMoney() {
    return _money;
  }

  int getGroupMoney() {
    return _groupMoney;
  }

  String getNote() {
    return _note;
  }

  DateTime getTime() {
    return _time;
  }

  void setID(int index) {
    _index = index;
  }

  void setMoney(int money) {
    _money = money;
  }

  void setGroupMoney(int groupMoney) {
    _groupMoney = groupMoney;
  }

  void setNote(String note) {
    _note = note;
  }

  void setTime(DateTime time) {
    _time = time;
  }

  bool less(Transaction other) {
    return _time.isBefore(other.getTime());
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

  @override
  String toString() {
    return "[$_index,${groupMoneyList[_groupMoney].name}, $_money, $_time, $_note]";
  }
}

void swapTransaction(Transaction a, Transaction b) {
  Transaction temp = a;
  a = b;
  b = temp;
}
