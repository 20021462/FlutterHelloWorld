import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  String error = '';

  int success = 0;

  void _reset() async {
    try {
      await auth.sendPasswordResetEmail(email: _emailController.text);
      setState(() {
        success = 1;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        success = 2;
        error = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(20, 110, 0, 0),
                  child: const Text(
                      "Don’t worry. \nEnter your email and we’ll send you a link to reset your password.",
                      style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        success == 0
                            ? ''
                            : (success == 1)
                            ? 'Send request successfully!'
                            : error,
                        style: const TextStyle(
                            color: Colors.red),
                      )
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7f3dff),
                        minimumSize: const Size(380, 56),
                        shape: shape,
                      ),
                      onPressed: () async {
                        _reset();
                      },
                      child: const Text(
                        "Send request",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                  ),

                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                            'Go Back',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 15
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}