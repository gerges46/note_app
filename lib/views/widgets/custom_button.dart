import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kPrimaryColor
      ),
      child: const Center(
        child: Text('Save',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
      ),
    );
  }
}