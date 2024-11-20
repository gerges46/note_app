import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';

import 'custom_note_item.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesInitial) {
          BlocProvider.of<NotesCubit>(context).fetchAllNote();
        }
      },
      builder: (context, state) {
        return BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            if (state is NotesSucess) {
              List<NoteModel> notes =
                  BlocProvider.of<NotesCubit>(context).notes!;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                    //  itemCount: state is NotesSucess ? state.notes.length : 0,
                    itemCount: notes.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: NoteItem(note: notes[index]),
                      );
                    }),
              );
            } else {
              throw Exception("error on fetch note ");
            }
          },
        );
      },
    );
  }
}
