// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String INCOME = "INCOME";
const String OUTCOME = "OUTCOME";
const double ICON_SIZE = 32;

const int UNDEFINED = 0;
const int FOOD = 1;
const int GASOLINE_EXPENSES = 2;
const int RENT = 3;
const int HOSPITAL = 4;
const int EDUCATION = 5;
const int PETS = 6;
const int ENTERTAINMENT = 7;
const int SPORTS = 8;
const int BILLS = 9;
const int INVESTMENT = 10;
const int SALARY = 11;
const int OTHER_INCOME = 12;

class Category {
  int id;
  String name;
  String type;
  IconData icon;
  Color color;
  Color background;

  Category(
      this.id, this.name, this.type, this.icon, this.color, this.background);
}

var categoryList = [
  Category(UNDEFINED, "Pick a money group", INCOME, Icons.question_mark,
      Colors.white, Colors.yellow),
  Category(
      FOOD, "Food&Drink", OUTCOME, Icons.restaurant, Colors.grey, Colors.white),
  Category(GASOLINE_EXPENSES, "Gasoline", OUTCOME, Icons.local_gas_station,
      Colors.red, Colors.red.shade100),
  Category(RENT, "Rent", OUTCOME, Icons.home, Colors.white,
      Colors.lightGreen.shade400),
  Category(HOSPITAL, "Hospital", OUTCOME, Icons.local_hospital, Colors.white,
      Colors.red),
  Category(EDUCATION, "Education", OUTCOME, Icons.school,
      Colors.indigo.shade800, Colors.cyan.shade100),
  Category(PETS, "Pets", OUTCOME, Icons.pets, Colors.pink.shade100, Colors.white),
  Category(ENTERTAINMENT, "Entertainment", OUTCOME, Icons.sports_esports,
      Colors.white, Colors.deepOrange),
  Category(SPORTS, "Sports", OUTCOME, Icons.sports_basketball, Colors.orange,
      Colors.orange.shade100),
  Category(BILLS, "Bills", OUTCOME, Icons.receipt, Colors.white,
      Colors.blue.shade300),
  Category(INVESTMENT, "Investment", OUTCOME, Icons.trending_up,
      Colors.yellow.shade400, Colors.blue),
  Category(SALARY, "Salary", INCOME, Icons.payments, Colors.green,
      Colors.green.shade100),
  Category(OTHER_INCOME, "Other income", INCOME, Icons.paid, Colors.green,
      Colors.green.shade100),
];
