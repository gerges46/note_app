import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/notes_view_body.dart';

import 'widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                builder: (context) {
                  return const CustomBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
        body:  NotesViewBody(),
      ),
    );
  }
}
