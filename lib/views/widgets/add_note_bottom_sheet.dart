import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/addnote_cubit.dart';
import 'form_bottom_sheet.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddnoteCubit(),
        child: BlocConsumer<AddnoteCubit, AddNoteState>(
            listener: (context, state) {
          if (state is AddNoteFailerState) {
            debugPrint("failed ${state.error}");
          }
          if (state is AddNoteSuccessState) {
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          // AbsorbPointer if it true it block any action in screen 
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState? true:false,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(child: AddNoteForm())),
          );
        }));
  }
}
