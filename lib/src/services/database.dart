import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felix_core/src/models/profile.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseFirestore.instance;
CollectionReference students = databaseReference.collection('students');
CollectionReference events = databaseReference.collection('events');

abstract class Database {
  Stream getProfileStream();
  Stream getEventsStream(String eventType);

  Future<void> updateProfile(Profile profile);
}

class DatabaseService implements Database {
  DatabaseService({@required this.uid});

  final String uid;

  Stream getProfileStream() {
    Stream profileStream = students.doc(uid).snapshots();
    return profileStream;
  }

  Stream getEventsStream(String eventType) {
    Stream eventsStream = students.doc(eventType).snapshots();
    return eventsStream;
  }

  Future<void> updateProfile(Profile profile) async {
    return students
        .doc(uid)
        .set(profile.toMap())
        .then((value) => print("Profile updated"))
        .catchError((error) => print("Failed to update profile: $error"));
  }
}
