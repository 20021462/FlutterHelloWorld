import 'package:flutter/material.dart';
import 'package:hello_world/design_system.dart';
import 'package:hello_world/module/group_money.dart';
import 'package:hello_world/module/moma_user.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hello_world/module/transaction.dart';

// ignore: must_be_immutable
class AddingPage extends StatefulWidget {
  final MomaUser appUser;

  const AddingPage({Key key, this.appUser}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  final date = DateTime.now();

  var moneyInput = 0.0;
  var descriptionInput = '';
  var groupInput = categoryList[0].id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 64,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            'Expense',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFFFD3C4A),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How much?',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextField(
                      controller: MoneyMaskedTextController(
                        leftSymbol: '\$',
                        thousandSeparator: ',',
                        decimalSeparator: '.',
                        precision: 2,
                        initialValue: moneyInput.toDouble(),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Input your money',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        String input = value.substring(1);
                        moneyInput = double.parse(input);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(45)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                margin: const EdgeInsets.only(top: 10),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField(
                        isDense: false,
                        alignment: Alignment.centerLeft,
                        itemHeight: 60,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        value: groupInput,
                        onChanged: (category) {
                          setState(() {
                            groupInput = category;
                          });
                        },
                        items: categoryList.map((group) {
                          return DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: group.id,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: group.background,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    group.icon,
                                    color: group.color,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(group.name),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 100),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      height: 60,
                      alignment: AlignmentDirectional.centerStart,
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Description',
                        ),
                        onChanged: (value) {
                          descriptionInput = value;
                        },
                      ),
                    ),
                    buildButton("Continue", large, colorType1, () {
                      if(groupInput == categoryList[0].id) return;
                      Transaction newTransaction = Transaction(moneyInput, date, groupInput, descriptionInput);
                      widget.appUser.addTransaction(newTransaction);
                      widget.appUser.showTransactions();
                      setState(() {
                        moneyInput = 0.0;
                        descriptionInput = '';
                        groupInput = categoryList[0].id;
                      });
                      }
                    ),
                    // Container(
                    //   height: 50,
                    //   width: double.infinity,
                    //   margin: const EdgeInsets.only(top: 70),
                    //   decoration: BoxDecoration(
                    //     color: Colors.deepPurple.shade400,
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       if(groupInput == categoryList[0].id) return;
                    //       Transaction newTransaction = Transaction(moneyInput, date, groupInput, descriptionInput);
                    //       widget.appUser.addTransaction(newTransaction);
                    //       widget.appUser.showTransactions();
                    //       setState(() {
                    //         moneyInput = 0.0;
                    //         descriptionInput = '';
                    //         groupInput = categoryList[0].id;
                    //       });
                    //     },
                    //     child: const Text(
                    //       'Continue',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         color: Colors.white,
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
