import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/cubit/notes_cubit.dart';

import 'package:note_app/views/widgets/custom_appbar.dart';

import 'note_list_view.dart';

// ignore: must_be_immutable
class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(
            title: 'Notes',
            icon: Icons.search,
          ),
          //  NoteItem(),
          Expanded(child: ListViewItem()),
        ],
      ),
    );
  }
}
