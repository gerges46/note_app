
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddNoteState> {
  AddnoteCubit() : super(AddnoteInitial());
}
