import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../models/notes_operation.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key, this.note}) : super(key: key);
  Note? note;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  Note? note;

  @override
  void initState() {
    super.initState();
    note = widget.note;
    titleController.text = note == null ? "" : note!.title;
    descController.text = note == null ? "" : note!.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Task Manager'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 80,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onFieldSubmitted: (value) {
                log(value);
              },
              onChanged: (value) {
                log(value);
                note = note?.copyWith(title: value);
              },
            ),
            Expanded(
              child: TextFormField(
                controller: descController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  note = note?.copyWith(description: value);
                },
              ),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isEmpty) {
                  return;
                }
                if (note == null) {
                  Provider.of<NotesOperation>(context, listen: false)
                      .addNewNote(Note(
                    id: 0,
                    title: titleController.text,
                    description: descController.text,
                  ));
                } else {
                  Provider.of<NotesOperation>(context, listen: false)
                      .updateNote(Note(
                    id: note!.id,
                    title: titleController.text,
                    description: descController.text,
                  ));
                }
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 10),
                backgroundColor: Colors.white,
              ),
              child: Text(
                note == null ? 'Add Note' : 'save Note',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
