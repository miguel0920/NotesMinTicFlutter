import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'models/note.dart';
import 'package:uuid/uuid.dart';

class AppState {
  late User? user;

  Future<void> logIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      user = credential.user;
      print(user);
    } else {
      print('No hay usuario !!');
    }
  }

  Future<void> register(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      user = credential.user;
      print(user);
    } else {
      print('No hay usuario !!');
    }
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  void addNote(Note note) {
    FirebaseFirestore.instance.collection('notes').add(<String, dynamic>{
      'id': const Uuid().v4(),
      'title': note.title,
      'notecontent': note.notecontent,
      'createDateTime': note.createDateTime,
      'updateDateTime': note.updateDateTime,
      'isActive': note.isActive,
      'userId': note.userId
    });
  }
}
