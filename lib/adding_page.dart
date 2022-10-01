import 'package:flutter/material.dart';
import 'package:hello_world/back_end/group_money.dart';
import 'package:hello_world/back_end/moma_user.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

// ignore: must_be_immutable
class AddingPage extends StatefulWidget {
  MomaUser appUser;

  AddingPage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  String categoryDropDownValue = groupMoneyList[0].name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFFFF6E6),
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
                      color: Color.fromARGB(170, 10, 0, 0),
                    ),
                  ),
                  TextField(
                    controller: MoneyMaskedTextController(
                      rightSymbol: 'đ',
                      thousandSeparator: ',',
                      decimalSeparator: '',
                      precision: 0,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input your money',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: false,
                      decimal: false,
                    ),
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(45)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20,
              ),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                value: categoryDropDownValue,
                                onChanged: (category) {
                                  setState(() {
                                    categoryDropDownValue = category;
                                  });
                                },
                                items: groupMoneyList.map((group) {
                                  return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: group.name,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        group.icon,
                                        const SizedBox(width: 10),
                                        Text(group.name),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
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
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                value: categoryDropDownValue,
                                onChanged: (category) {
                                  setState(() {
                                    categoryDropDownValue = category;
                                  });
                                },
                                items: groupMoneyList.map((group) {
                                  return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: group.name,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        group.icon,
                                        const SizedBox(width: 10),
                                        Text(group.name),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
