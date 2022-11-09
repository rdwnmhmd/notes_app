import 'dart:developer';

import 'package:flutter/cupertino.dart';
import './note.dart';

class NotesOperation with ChangeNotifier {
  //List of note
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  int get newId {
    return _notes.length + 1;
  }

  void addNewNote(Note note) {
    log('addNote');
    note.id = newId;
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(Note note) {
    _notes[note.id - 1] = note;
    notifyListeners();
  }
  // // void updateProduct(String title, String description) {
  // //   final noteIndex = _notes.indexWhere((note) => note.title == title);
  // //   _notes[noteIndex] = ;
  // //   notifyListeners();
  // }
}
