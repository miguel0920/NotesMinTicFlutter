import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteminticflutter/appState.dart';
import 'package:noteminticflutter/models/note.dart';

import 'package:uuid/uuid.dart';

class ShowDialogNewNote {
  static TextEditingController title = TextEditingController();
  static TextEditingController content = TextEditingController();

  Future<void> showMyDialog(BuildContext context, AppState state) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nombre Nota: ',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  controller: title,
                  decoration: const InputDecoration(
                      hintText: 'Titulo',
                      fillColor: Colors.yellow,
                      filled: true)),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Contenido Nota: ',
                  style: TextStyle(color: Colors.black54)),
              TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  maxLength: 1000,
                  controller: content,
                  decoration: const InputDecoration(
                      hintText: 'Descripción',
                      fillColor: Colors.yellow,
                      filled: true))
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(102, 102, 102, 1))),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'CANCELAR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(1, 255, 26, 1))),
              onPressed: () => {
                state.addNote(Note(
                    id: const Uuid().v1().toString(),
                    title: title.text,
                    notecontent: content.text,
                    createDateTime: Timestamp.now(),
                    updateDateTime: null,
                    isActive: true,
                    userId: state.user!.uid)),
                Navigator.pop(context, 'OK')
              },
              child: const Text(
                'CREAR',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
