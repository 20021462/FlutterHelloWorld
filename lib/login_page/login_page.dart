import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';
import 'package:hello_world/login_page/reset_password.dart';
import 'package:hello_world/login_page/sign_up.dart';
import 'package:hello_world/main.dart';

import '../back_end/moma_user.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  MomaUser appUser;

  LoginPage({Key key, this.appUser}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = '';

  void _singIn() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text))
          .user;
      if (user != null) {
        widget.appUser = MomaUser(_emailController.text);
        setState(() {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => HomePage(appUser: widget.appUser,))
          );
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
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
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
                    child: const Text("Login",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold
                        )
                    ),
                  )
                ],
              ),
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
                  const SizedBox(height: 25,),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      )
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7f3dff),
                        minimumSize: Size(380, 56),
                        shape: shape,
                      ),
                      onPressed: () async {
                        _singIn();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                  ),
                  SizedBox(height: 25,),
                  Container(
                    //alignment: const Alignment(),
                    //padding: const EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ResetPassword())
                        );
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an acoount yet? ',
                        style: TextStyle(
                          color: Colors.grey,

                        ),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  SignupPage())
                          );
                        },
                        child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              fontSize: 15,
                            )
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        )
    );
  }
}