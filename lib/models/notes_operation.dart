import 'package:flutter/cupertino.dart';
import './note.dart';

class NotesOperation with ChangeNotifier {
  //List of note
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  void addNewNote(String title, String description) {
    //Note object
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }

  // // void updateProduct(String title, String description) {
  // //   final noteIndex = _notes.indexWhere((note) => note.title == title);
  // //   _notes[noteIndex] = ;
  // //   notifyListeners();
  // }
}
