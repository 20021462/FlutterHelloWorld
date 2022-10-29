
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_page/login_page.dart';
import '../module/moma_user.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

final FirebaseAuth auth= FirebaseAuth.instance;


class ProfilePage extends StatefulWidget {
  MomaUser appUser;

  ProfilePage({Key key,this.appUser}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool check=auth.currentUser?.email!=null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30,bottom: 20,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ProfilePic(),
                const SizedBox(width: 15),
                Text(check? checkNull(auth.currentUser?.email):"/email_address/"),
              ],
            ),
          ),
          ProfileMenu(
            text: "Account",
            icon: Icons.person,
            logout: false,
            press: () => {
              setState((){
                check =(auth.currentUser?.email!=null);
              }),
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: Icons.notifications,
            logout: false,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            logout: false,
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Icons.help_outline,
            logout: false,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            logout: true,
            press: () {_logout();},
          ),
        ],
      ),
    );
  }

  String checkNull(String text){
    if(text!= null) return text;
    return '/email_address/';
  }

  void _logout() {
    auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage(appUser: widget.appUser,)));
  }
}