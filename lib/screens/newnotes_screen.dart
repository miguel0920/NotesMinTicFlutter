import 'dart:core';

import 'package:flutter/material.dart';

class NewNotes extends StatelessWidget {
  const NewNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {},
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
                child: const Icon(Icons.add, size: 36.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
