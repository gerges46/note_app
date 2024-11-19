/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditNoteView()));
      },
      child: Container(
        padding:const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color:const Color(0xffdbcc23),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
      
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:const Text('Flutter Tips',style: TextStyle(color: Colors.black,fontSize: 26),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text('Build your carerr with me',style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 18)),
              ),
          
              trailing: IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.trash,color: Colors.black,size: 24,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text('May21,2022',style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
} */
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note; // Accept the note dynamically

  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditNoteView()),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title, // Display the note title
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.subtitle, // Display the note content
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
              
             showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Rounded corners
                        ),
                        backgroundColor:
                            const Color(0xFFF8F9FA), // Light background color
                        icon: const Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                          size: 48,
                        ),
                        title: const Text(
                          'Delete Note?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        content: const Text(
                          'Are you sure you want to delete this note?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Dismiss dialog
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.green, // "No" button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              note.delete();
                                    Navigator.pop(context); 
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.red, // "Delete" button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ); 

              // note.delete();
               print("succes delete");
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date, // Display the note's date
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
