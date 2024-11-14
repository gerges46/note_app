import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
      hintText: 'title',
      hintStyle: const TextStyle(
        color: kPrimaryColor
      ),
      border: buildBorder(),
      enabledBorder: buildBorder(kPrimaryColor),
      
    ),);
  }
// [color ] These parameters are also optional,
  OutlineInputBorder buildBorder( [color]) {
    return OutlineInputBorder(

      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:color?? Colors.white,
      )
    );
  }
}