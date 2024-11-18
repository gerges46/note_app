part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}
class NotesLoading extends NotesState{}
class NotesSucess extends NotesState{
  final List<NoteModel> notes;

  NotesSucess(this.notes);
}
class NotesFailed extends NotesState{
 final String errorMessage;
  NotesFailed(this.errorMessage);
}
