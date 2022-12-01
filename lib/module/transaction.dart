import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world/module/group_money.dart';

class MomaTransaction {
  int index;
  double money;
  DateTime time;
  int category;
  String note;

  MomaTransaction(this.money, this.time, this.category, this.note) {
    index = -1;
  }

  MomaTransaction.withIndex(this.index, this.money, this.time, this.category, this.note);

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

  bool after(MomaTransaction other) {
    return time.compareTo(other.getTime()) >0;
  }

  bool equal(MomaTransaction other) {
    return time.compareTo(other.getTime()) ==0;
  }

  String info() {
    return "id = $index\nmoney = $money\ntime = time\ncategory = ${categoryList[category].name}\nnote = $note";
  }

  Map<String,dynamic> toJson() => {
    'index': index,
    'money': money,
    'time': time,
    'category': category,
    'note': note,
  };

  static MomaTransaction fromJson(Map<String, dynamic> json) => MomaTransaction.withIndex(
      json['index'],
      json['money'],
      (json['time'] as Timestamp).toDate(),
      json['category'],
      json['note']
  );

  @override
  int get hashCode => super.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is MomaTransaction) {
      if (other.getMoney() == getMoney()) {
        return true;
      }
    }
    return false;
  }
}
