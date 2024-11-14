import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        
        children: [
          SizedBox(height: 32,),
          CustomTextField()
        ],
      ),
    );
  }
}