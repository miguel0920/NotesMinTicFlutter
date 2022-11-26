import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String title;
  final String notecontent;
  final Timestamp createDateTime;
  final Timestamp? updateDateTime;
  final bool isActive;
  final String userId;

  Note(
      {required this.id,
      required this.title,
      required this.notecontent,
      required this.createDateTime,
      required this.updateDateTime,
      required this.isActive,
      required this.userId});
}
