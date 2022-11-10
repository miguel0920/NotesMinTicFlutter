import 'package:flutter/material.dart';
import 'package:noteminticflutter/screens/login_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      title: "NOTapp",
      home: LoginScreen(formKey: _formKey),
    );
  }
}
