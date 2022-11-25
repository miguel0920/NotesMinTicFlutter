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
                  controller: TextEditingController(text: title),
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
                  controller: TextEditingController(text: content),
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
