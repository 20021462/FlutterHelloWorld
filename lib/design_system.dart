import 'package:flutter/material.dart';

const mainColor = Color(0xff7f3dff);
final shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),

);

const Size sizeType1 = Size(370, 56);
const Size sizeType2 = Size(380, 65);
const Size normalSize = Size(180, 65);
const bool colorType1 = true;
const bool colorType2 = false;

Widget buildButton(
  String text,
  Size size,
  bool colorType,
  VoidCallback onPressed,
) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorType ? mainColor : Colors.grey.shade300,
        minimumSize: size,
        shape: shape,
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorType ? Colors.white : mainColor,
        ),
      ));
}
