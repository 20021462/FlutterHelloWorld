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
      color: const Color(0xFFFFF6E6),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 30),
            child: SafeArea(
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
                    style: const TextStyle(fontSize: 25),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButtonFormField(
                          value: categoryDropDownValue,
                          items: groupMoneyList
                              .map((group) {
                                return group.name;
                              })
                              .toList()
                              .map((name) {
                                return DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.center,
                                  value: name,
                                  child: Text(name),
                                );
                              })
                              .toList(),
                          onChanged: (category) {
                            setState(() {
                              categoryDropDownValue = category;
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        const TextField(
                          decoration: InputDecoration(hintText: 'Description'),
                        ),
                        const SizedBox(height: 180),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
