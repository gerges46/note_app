import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddNoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
 
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailerState(e.toString()));

    }
  }
}
