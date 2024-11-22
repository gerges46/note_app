import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/edit_note_color_list_view.dart';

import 'custom_appbar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
// note if i make varable in widget it good to make it statfull not statless it prefere not be final with statefull
// final used when you now that varable will not change we use it
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppbar(
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
              // to save object in database after edit becouse it extend hive object in model it easy to use some func
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNote();
              Navigator.pop(context);
            },
            title: "Edit Note",
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hint: 'title ',
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: "content",
            maxLine: 6,
            onChange: (value) {
              content = value;
            },
          ),
           EditNoteColorList(note: widget.noteModel,),
        ],
      ),
    );
  }
}
 