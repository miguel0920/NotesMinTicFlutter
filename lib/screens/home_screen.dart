import 'dart:core';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/screens/newnotes_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(91, 91, 90, 1),
      body: Column(children: const [NewNotes()]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            barrierLabel: "Label",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 700),
            context: context,
            pageBuilder: (context, anim1, anim2) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 100,
                  margin:
                      const EdgeInsets.only(bottom: 80, left: 12, right: 12),
                  child: SizedBox.expand(
                      child: Column(
                    children: [
                      const Text('Usuario123',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                        child: const Text("SALIR",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        onPressed: () {},
                      ),
                    ],
                  )),
                ),
              );
            },
            transitionBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position:
                    Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                        .animate(anim1),
                child: child,
              );
            },
          );
        },
        backgroundColor: Colors.yellow,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: const Icon(
          Icons.more_vert,
          size: 50.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget logOut = TextButton(
    child: const Text("SALIR",
        style: TextStyle(
          color: Colors.black,
        )),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
    title: const Text(
      "Usuario132",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actionsAlignment: MainAxisAlignment.start,
    actions: [
      logOut,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
