
import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key,required this.note});
final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
 late int currentIndex;
 @override
  void initState() {
    // this is to make inital color is color of note 
  currentIndex=kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {

                  widget.note.color=kColors[index].value;
                  // to change color he choose
                  
                  setState(() {
                   
                    currentIndex = index;
                   
                  });
                },
                child: ColorItem(
                  // check which one is selcet or active
                  isActive: currentIndex == index,
                  color: kColors[index],
                ),
              ),
            );
          }),
    );
  }
}