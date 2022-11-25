import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noteminticflutter/screens/mytextfielpassword_screen.dart';
import 'package:noteminticflutter/appState.dart';

class Registration extends StatelessWidget {
  static late String password;
  static TextEditingController email = TextEditingController();
  final AppState state;

  const Registration(
      {Key? key, required GlobalKey<FormState> formKey, required this.state})
      : _formKey = formKey,
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
              SvgPicture.asset(
                '../assets/images/logo_register.svg',
                matchTextDirection: true,
                semanticsLabel: 'NOTapp Logo register',
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: email,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white),
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
                  MyTextFielPassword(
                    fillColor: const Color.fromARGB(255, 0, 0, 0),
                    textStyleColor: Colors.white,
                    passwordChange: (value) {
                      password = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Process data.
                            Navigator.of(context).pushReplacementNamed('/');
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  await state
                                      .register(email.text, password)
                                      .then((value) => {
                                            if (state.user != null)
                                              {
                                                Navigator.of(context)
                                                    .pushReplacementNamed(
                                                        '/home')
                                              }
                                          });
                                } catch (e) {
                                  print(e);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "El correo ya se encuentra registrado."),
                                  ));
                                }
                              }
                            },
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 16.0)),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(20, 255, 0, 1))),
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
