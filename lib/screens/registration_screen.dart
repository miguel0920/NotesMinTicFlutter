import 'dart:core';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/screens/home_screen.dart';
import 'package:noteminticflutter/screens/login_screen.dart';
import 'package:noteminticflutter/screens/mytextfielpassword_screen.dart';

class Registration extends StatelessWidget {
  const Registration({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 237, 7, 1),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Registro',
                  style: TextStyle(fontSize: 24.0, color: Colors.black)),
              const Text('NOTapp',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Image.asset('images/logo_login.png', width: 80.0, height: 100.0),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(107, 106, 106, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        filled: true,
                        fillColor: Color.fromARGB(255, 0, 0, 0),
                        hintText: 'Correo electronico',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 8, right: 15, bottom: 0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    validator: (String? email) {
                      if (email == null || email.isEmpty) {
                        return 'Ingrese el correo electronico';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const MyTextFielPassword(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Process data.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        formKey: GlobalKey(),
                                      )),
                            );
                          },
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 16)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(167, 167, 167, 1))),
                          child: const Text('Volver'),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Process data.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              }
                            },
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 16.0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            child: const Text('Registrar'),
                          )),
                    ],
                  ),
                ]),
              )
            ]),
      ),
    );
  }
}
