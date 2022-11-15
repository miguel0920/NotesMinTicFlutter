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
          onPressed: () {},
          backgroundColor: Colors.yellow,
          child: const Icon(
            Icons.more_vert,
            size: 35.0,
            color: Colors.black,
          )),
    );
  }
}
