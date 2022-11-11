import 'dart:core';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
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
              const Text('NOTapp',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Image.asset('images/logo_login.png', width: 140.0, height: 160.0),
              const SizedBox(
                height: 40.0,
              ),
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  TextFormField(
                    controller:
                        TextEditingController(text: "pruebas@gmail.com"),
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
                        fillColor: Color.fromRGBO(107, 106, 106, 1),
                        hintText: 'Correo electronico',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 8, right: 15, bottom: 0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.0,
                                color: Color.fromRGBO(107, 106, 106, 1)),
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
                  // TextFormField(
                  //   obscureText: true,
                  //   decoration: const InputDecoration(
                  //     focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: 2.0,
                  //             color: Color.fromRGBO(107, 106, 106, 1)),
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(10.0))),
                  //     filled: true,
                  //     fillColor: Color.fromRGBO(107, 106, 106, 1),
                  //     hintText: 'Contraseña',
                  //     hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                  //     contentPadding: EdgeInsets.only(
                  //         left: 15, top: 8, right: 15, bottom: 0),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: 2.0,
                  //             color: Color.fromRGBO(107, 106, 106, 1)),
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(10.0))),
                  //   ),
                  //   validator: (String? password) {
                  //     if (password == null || password.isEmpty) {
                  //       return 'Ingrese la contraseña';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const MyTextFielPassword(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Process data.
                          },
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 16)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(167, 167, 167, 1))),
                          child: const Text('Registrar'),
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
                                    MaterialStateProperty.all(Colors.black)),
                            child: const Text('Ingresar'),
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

class MyTextFielPassword extends StatefulWidget {
  const MyTextFielPassword({super.key});

  @override
  State<MyTextFielPassword> createState() => _MyTextFielPassword();
}

class _MyTextFielPassword extends State<MyTextFielPassword> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (value) {
          hidePassword = false;
        },
        controller: TextEditingController(text: "Vignesh123!"),
        obscureText: hidePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: Colors.black,
            icon: hidePassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.0, color: Color.fromRGBO(107, 106, 106, 1)),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          filled: true,
          fillColor: const Color.fromRGBO(107, 106, 106, 1),
          hintText: 'Contraseña',
          hintStyle: const TextStyle(fontSize: 18, color: Colors.white),
          contentPadding:
              const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.0, color: Color.fromRGBO(107, 106, 106, 1)),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
        validator: (String? password) {
          if (password == null || password.isEmpty) {
            return 'Ingrese la contraseña';
          } else {
            String pattern =
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
            RegExp regExp = RegExp(pattern);
            if (!regExp.hasMatch(password)) {
              return 'La contraseña requiere una letra en mayuscula, un caracter especial y minimo de 8 caracteres.';
            }
          }
          return null;
        });
  }
}
