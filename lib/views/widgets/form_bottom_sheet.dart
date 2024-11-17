import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  // to check validate 
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  // note that if you create object in staless widget it must be final and if stfull not nessery to be final becouse stfull keep value in state 
 String? title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child:  Column(
        
        children: [
          const SizedBox(height: 32,),
          CustomTextField(hint: 'title',onSaved: (vaule) {
            title=vaule;
          },),
          const SizedBox(height: 16,),
          CustomTextField(hint: 'content',maxLine: 6,onSaved: (value) {
            subtitle=value;
          },),
          const SizedBox(height: 24,),
     CustomButton(
            onTap: () {
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                autovalidateMode=AutovalidateMode.always;
                setState(() {
                  
                });
              }
            },
          ),
      
        ],
      ),
    );
  }
}
