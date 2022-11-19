import 'package:flutter/material.dart';
import 'package:noteminticflutter/screens/home_screen.dart';
import 'package:noteminticflutter/screens/login_screen.dart';
import 'package:noteminticflutter/screens/registration_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(formKey: _formKey),
        '/home': (context) => const Home(),
        '/register': (context) => Registration(formKey: GlobalKey())
      },
    );
  }
}
