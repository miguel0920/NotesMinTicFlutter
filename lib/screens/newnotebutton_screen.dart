import 'dart:core';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/appState.dart';
import 'package:noteminticflutter/screens/showDialogs/showdialognewnote_screen.dart';

class NewNoteButton extends StatelessWidget {
  final String title;
  final String content;
  final ShowDialogNewNote showDialogNewNote;
  final AppState state;

  const NewNoteButton(
      {Key? key,
      required this.title,
      required this.content,
      required this.showDialogNewNote,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {
            showDialogNewNote.showMyDialog(context, state);
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(146, 146, 146, 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nota Nueva', style: TextStyle(fontSize: 24.0)),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: const Icon(Icons.add, size: 40.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
