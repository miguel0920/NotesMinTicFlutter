import 'dart:core';

import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350.0,
        height: 50.0,
        child: ElevatedButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1)),
          child: const Text('Mi primera Nota',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
