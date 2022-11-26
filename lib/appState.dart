import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/note.dart';
import 'package:uuid/uuid.dart';

class AppState {
  late final StreamController<List<Note>> _entriesStreamController;
  Stream<List<Note>> get notes => _entriesStreamController.stream;
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

  void _listForNotes(String userID) {
    FirebaseFirestore.instance.collection('notes').snapshots().listen((event) {
      final notes = event.docs
          .map((DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Note(
                userId: data['updateDateTime'] as String,
                isActive: data['updateDateTime'] as bool,
                updateDateTime: data['updateDateTime'] as Timestamp,
                createDateTime: data['createDateTime'] as Timestamp,
                notecontent: data['notecontent'] as String,
                title: data['title'] as String,
                id: data['id'] as String);
          })
          .where((element) => element.userId == userID)
          .toList();
      _entriesStreamController.add(notes);
    });
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
