import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(91, 91, 90, 1),
      body: Column(children: [
        ElevatedButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: const Color.fromRGBO(146, 146, 146, 1)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const Text('Nota Nueva', style: TextStyle(fontSize: 24.0)),
              const SizedBox(
                width: 100,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: 40.0,
                height: 40.0,
                child: const Icon(
                  Icons.add,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
