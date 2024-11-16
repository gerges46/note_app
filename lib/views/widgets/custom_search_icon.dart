import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {

 final IconData icon;

  const CustomSearchIcon({super.key, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
         color: Colors.white.withOpacity(.05),
      ),
      child: Center(child: Icon(icon,size: 26,),),
    );
  }
}