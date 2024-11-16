part of 'addnote_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddnoteInitial extends AddNoteState {}
class AddNoteLoadingState extends AddNoteState{}
class AddNoteSuccessState extends AddNoteState{}
class AddNoteFailerState extends AddNoteState{
  final String error;

  AddNoteFailerState(this.error);
  
}
