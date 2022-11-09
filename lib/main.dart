import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginNotes();
}

class _LoginNotes extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NOTapp",
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(232, 237, 7, 1),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      maxLength: 100,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(107, 106, 106, 1),
                          hintText: 'Correo electronico',
                          contentPadding: EdgeInsets.only(
                              left: 15, top: 8, right: 15, bottom: 0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return 'Ingrese el correo electronico';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLength: 100,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(107, 106, 106, 1),
                        hintText: 'Contraseña',
                        contentPadding: EdgeInsets.only(
                            left: 15, top: 8, right: 15, bottom: 0),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      validator: (String? password) {
                        if (password == null || password.isEmpty) {
                          return 'Ingrese la contraseña';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 10.0),
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Process data.
                                }
                              },
                              style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 18)),
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
      ),
    );
  }
}
