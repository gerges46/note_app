import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_appbar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppbar(
            title: "Edit Note",
            icon:Icons.check ,
          ),
          SizedBox(height: 50,),
          CustomTextField(hint: 'title '),
          SizedBox(height: 16,),
          CustomTextField(hint: "content",maxLine: 6,),
        ],
      ),
    );
  }
}