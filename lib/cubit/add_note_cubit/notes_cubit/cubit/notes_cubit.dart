
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNote(NoteModel note) async {
  
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
 
    List<NoteModel> notes= notesBox.values.toList();
      emit(NotesSucess(notes));
    } catch (e) {
      emit(NotesFailed(e.toString()));

    }
  }
}
