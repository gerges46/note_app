import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubit/add_note_cubit/addnote_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/notes_view.dart';

void main() async{
  runApp(const NotesApp());
await  Hive.initFlutter();
await Hive.openBox(kNoteBox);
Hive.registerAdapter(NoteModelAdapter());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AddnoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}