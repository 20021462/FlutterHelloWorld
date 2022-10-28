import 'package:flutter/material.dart';
import 'module/moma_user.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  MomaUser appUser;

  ProfilePage({Key key, MomaUser appUser}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Alert Dialog",
            style: TextStyle(fontSize: 30),
          ),
          AlertDialog(
            title: const Text('Do you want to exit'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("No"),
                onPressed: () {},
              ),
              ElevatedButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
