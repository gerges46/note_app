import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_appbar.dart';

import 'custom_note_item.dart';
import 'note_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppbar(),
          NoteItem(),
          Expanded(child: ListViewItem()),
        ],
      ),
    );
  }
}
