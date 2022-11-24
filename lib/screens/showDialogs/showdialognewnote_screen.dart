import 'package:flutter/material.dart';

class ShowDialogNewNote {
  Future<void> showMyDialog(
      BuildContext context, String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombre Nota: '),
              TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(text: title),
                decoration: const InputDecoration(
                    fillColor: Colors.yellow, filled: true),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Contenido Nota: '),
              TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  maxLength: 1000,
                  controller: TextEditingController(text: content),
                  decoration: const InputDecoration(
                      fillColor: Colors.yellow, filled: true))
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
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
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(1, 255, 26, 1))),
              onPressed: () => Navigator.pop(context, 'OK'),
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
