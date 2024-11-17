/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/addnote_cubit.dart';
import 'package:note_app/model/note_model.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // to check validate
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // note that if you create object in staless widget it must be final and if stfull not nessery to be final becouse stfull keep value in state
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'title',
            onSaved: (vaule) {
              title = vaule;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'content',
            maxLine: 6,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            onTap: () {
     
                if (formKey.currentState!.validate()) {
                  var noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: DateTime.now().toString(),
                      color: Colors.blue.value);
                  formKey.currentState!.save();
                  BlocProvider.of<AddnoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
            
            },
          ),
        ],
      ),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/addnote_cubit.dart';
import 'package:note_app/model/note_model.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // To check validate
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // Note that if you create object in Stateless widget it must be final and if Stateful not necessary to be final because Stateful keeps value in state
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'content',
            maxLine: 6,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<AddnoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoadingState? true:false,
                onTap: () {
                  if (formKey.currentState != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          date: DateTime.now().toString(),
                          color: Colors.blue.value);
                      BlocProvider.of<AddnoteCubit>(context).addNote(noteModel);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    print("Form key current state is null");
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
