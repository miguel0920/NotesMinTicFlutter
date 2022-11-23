import 'dart:core';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/appState.dart';
import 'package:noteminticflutter/screens/newnotebutton_screen.dart';
import 'package:noteminticflutter/screens/note_screen.dart';

class Home extends StatelessWidget {
  final AppState state;
  const Home({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = state.user!.displayName ?? '';
    return Scaffold(
      backgroundColor: const Color.fromRGBO(91, 91, 90, 1),
      body: Column(children: const [NewNoteButton(), Note()]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogLogOut(context, name);
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

  Future<Object?> showDialogLogOut(BuildContext context, String name) {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 50),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 100,
            margin: const EdgeInsets.only(bottom: 80, left: 12, right: 12),
            child: SizedBox.expand(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 0.0, top: 10.0, bottom: 0.0),
                  child: Text(name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          decoration: TextDecoration.none)),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                  thickness: 2.0,
                  indent: 15.0,
                  endIndent: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 0.0, top: 2.0, bottom: 0.0),
                  child: TextButton(
                    onPressed: () {
                      state.logOut();
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    style: ButtonStyle(
                        alignment: Alignment.centerLeft,
                        fixedSize:
                            MaterialStateProperty.all(const Size(350, 20))),
                    child: const Text("SALIR",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            )),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
