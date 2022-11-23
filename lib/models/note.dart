import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String title;
  final String notecontent;
  final Timestamp createDateTime;
  final Timestamp updateDateTime;
  final bool isActive;
  final String userId;

  Note(this.id, this.title, this.notecontent, this.createDateTime,
      this.updateDateTime, this.isActive, this.userId);
}
