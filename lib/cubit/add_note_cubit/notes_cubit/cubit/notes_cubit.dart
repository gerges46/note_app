
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
 List<NoteModel>? notes;

static NotesCubit get(BuildContext rxt) => BlocProvider.of(rxt);



  fetchAllNote(/* NoteModel note */) async {
  
  // i dont use try and catch becouse this is not future and i make object only i dont need it becouse it take resourse and it dont it 
      var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes= notesBox.values.toList();
   //   emit(NotesSucess());
   emit(NotesSucess());
   print("fetch done");
   print('done');
  
  
  }
}
