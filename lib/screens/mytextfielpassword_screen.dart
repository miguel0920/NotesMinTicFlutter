import 'dart:core';

import 'package:flutter/material.dart';

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
