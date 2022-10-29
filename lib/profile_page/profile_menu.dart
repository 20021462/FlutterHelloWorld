import 'package:flutter/material.dart';
import 'package:hello_world/design_system.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key key,
    this.text,
    this.icon,
    this.logout,
    this.press,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback press;
  final bool logout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: logout? Color(0xFFFFE2E4):Color(0xFFEEE5FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: logout? Color(0xFFFD3C4A):mainColor,
                size: 25,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text,style:TextStyle(color: Colors.black,fontSize: 16),),),
            //const Icon(Icons.arrow_forward_ios,color: Colors.black,),
          ],
        ),
      ),
    );
  }
}