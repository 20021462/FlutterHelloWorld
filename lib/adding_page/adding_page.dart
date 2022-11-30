import 'package:flutter/material.dart';
import 'package:hello_world/adding_page/adding_form.dart';
import 'package:hello_world/module/group_money.dart';
import 'package:hello_world/module/moma_user.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hello_world/scroll_behavior.dart';
import 'package:intl/intl.dart';

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
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    timeInput.text = "";
    super.initState();
  }

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
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      AddingFormField(
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                      AddingFormField(
                        child: TextFormField(
                          controller: dateInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(Icons.calendar_today),
                            iconColor: Theme.of(context).backgroundColor,
                            suffixIconColor: Theme.of(context).backgroundColor,
                            prefixIconColor: Theme.of(context).backgroundColor,
                            hintText: "Enter Date",
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('MM-dd-yyyy').format(pickedDate);
                              setState(() {
                                dateInput.text = formattedDate;
                              });
                            } else {}
                          },
                        ),
                      ),
                      AddingFormField(
                        child: TextFormField(
                          controller: timeInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(Icons.schedule),
                            iconColor: Theme.of(context).backgroundColor,
                            suffixIconColor: Theme.of(context).backgroundColor,
                            prefixIconColor: Theme.of(context).backgroundColor,
                            hintText: "Enter Time",
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              // ignore: use_build_context_synchronously
                              String formattedTime = pickedTime.format(context);
                              setState(() {
                                timeInput.text = formattedTime;
                              });
                            } else {}
                          },
                        ),
                      ),
                      AddingFormField(
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Description',
                          ),
                          onChanged: (value) {
                            descriptionInput = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size.fromHeight(56),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        onPressed: () {
                          //print(widget.appUser);
                          // widget.appUser.addTransaction(Transaction(
                          //     moneyInput, date, groupInput, descriptionInput));
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
