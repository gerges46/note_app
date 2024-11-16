import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

import 'custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(height: 32,),
            CustomTextField(hint: 'title',),
            SizedBox(height: 16,),
            CustomTextField(hint: 'content',maxLine: 6,),
            SizedBox(height: 24,),
            CustomButton(),
        
          ],
        ),
      ),
    );
  }
}
