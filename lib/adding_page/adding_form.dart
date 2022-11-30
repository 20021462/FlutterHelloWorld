import 'package:flutter/material.dart';

class AddingFormField extends StatelessWidget {
  const AddingFormField({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      height: 60,
      alignment: AlignmentDirectional.centerStart,
      child: child,
    );
  }
}
