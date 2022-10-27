import 'package:flutter/material.dart';

const mainColor = Color(0xff7f3dff);
final shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
);

const Size sizeType1 = Size(370, 56);
const Size sizeType2 = Size(380, 65);

Widget buildButton(String text, Size size,VoidCallback onPressed,){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        minimumSize: size,
        shape: shape,
      ),
      onPressed: () {
        onPressed;
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),)
  );
}