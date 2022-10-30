//git bash: $ ./genhtml.perl ./coverage/lcov.info -o coverage/html

import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/module/moma_user.dart';
import 'package:hello_world/module/transaction.dart';
import 'package:hello_world/module/group_money.dart';

void main() {
  MomaUser user = MomaUser("test@gmail.com");
  user.addTransaction(Transaction(100000, DateTime(2022, 10, 21), SALARY, ""));
  user.addTransaction(Transaction(20000, DateTime(2022, 10, 22), FOOD, ""));
  user.addTransaction(
      Transaction(20000, DateTime(2022, 10, 23), GASOLINE_EXPENSES, ""));
  user.addTransaction(Transaction(20000, DateTime(2022, 10, 20), FOOD, ""));
  user.addTransaction(Transaction(20000, DateTime(2022, 10, 22), FOOD, ""));

  test('get email test', () => {expect(user.gmail, "test@gmail.com")});

  test('get curent money test', () => {expect(user.getCurrentMoney(), 20000)});

  test('transactions empty test',
      () => {expect(user.isTransactionEmpty(), false)});

  test(
      'find transaction test',
      () => {
            expect(user.findID(1),
                Transaction(20000, DateTime(2022, 10, 22), FOOD, ""))
          });

  test(
      'remove transaction test',
      () => {
            expect(
                user.removeID(2),
                Transaction(
                    20000, DateTime(2022, 10, 21), GASOLINE_EXPENSES, ""))
          });
  user.showTransactions();

  test('getID transaction test', () => {expect(user.findID(0).getID(), 0)});

  test('find transaction test', () => {expect(user.findID(0).getID(), 0)});

  user.findID(0).setMoney(150000);
  user.findID(0).setNote("special deal");

  test('check transaction money test',
      () => {expect(user.findID(0).getMoney(), 150000)});

  test('check currentMoney after change test',
      () => {expect(user.currentMoney, 70000)});
}
