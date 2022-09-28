import 'package:flutter/material.dart';

import 'back_end/moma_user.dart';

class AccountPage extends StatefulWidget {
  MomaUser appUser;

  AccountPage({Key key,MomaUser appUser}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Alert Dialog",
          style: TextStyle(fontSize: 30),
        ),
        AlertDialog(
          title: new Text('Do you want to exit'),
          actions: <Widget>[
            ElevatedButton(
              child: Text("No"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    ));
  }
}
