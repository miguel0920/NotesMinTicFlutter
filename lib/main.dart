import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:noteminticflutter/appState.dart';
import 'package:noteminticflutter/firebase_options.dart';
import 'package:noteminticflutter/screens/home_screen.dart';
import 'package:noteminticflutter/screens/login_screen.dart';
import 'package:noteminticflutter/screens/showDialogs/showdialognewnote_screen.dart';
import 'package:noteminticflutter/screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb
          ? DefaultFirebaseOptions.web
          : DefaultFirebaseOptions.currentPlatform);

  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      print(e);
    }
  }

  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginNotes();
}

class _LoginNotes extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppState state = AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      title: "NOTapp",
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(formKey: _formKey, state: state),
        '/home': (context) => Home(
              state: state,
            ),
        '/register': (context) =>
            Registration(formKey: GlobalKey(), state: state)
      },
    );
  }
}
