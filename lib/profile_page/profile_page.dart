
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/design_system.dart';

import '../login_page/login_page.dart';
import '../module/moma_user.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

final FirebaseAuth auth= FirebaseAuth.instance;

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  final MomaUser appUser;

  const ProfilePage({Key key, this.appUser}) : super(key: key);

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
            padding: const EdgeInsets.only(left: 30,top:10,bottom: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ProfilePic(),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Username",style: TextStyle(fontSize: 14),),
                    SizedBox(height: 5,),
                    Text("Hoàng Long",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  ],
                ),
                //IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
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
            press: () {showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                ),
                context: context,
                builder: (BuildContext context){
                  return Container(
                      padding: const EdgeInsets.only(top:30,bottom: 30,),
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Logout",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text("Are you sure you want to logout?", style: TextStyle(fontSize: 16,color: Colors.grey.shade500),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildButton("No", half,colorType2,() {Navigator.pop(context);}),
                            buildButton("Yes", half,colorType1,() {_logout();})
                          ],
                        )
                      ],
                    )
                  );
                }
            );
            },
          ),
        ],
      ),
    );
  }

  void _logout() {
    auth.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);

    Navigator.of(context).pushReplacement(

        MaterialPageRoute(builder: (context) => LoginPage(appUser: widget.appUser,)));
  }


}