import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felix_core/src/models/profile.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseFirestore.instance;
CollectionReference users = databaseReference.collection('users');

abstract class Database {
  Stream getProfileStream();

  Future<void> updateProfile(Profile profile);
}

class DatabaseService implements Database {
  DatabaseService({@required this.uid});

  final String uid;

  Stream getProfileStream() {
    Stream profileStream = users.doc(uid).snapshots();
    return profileStream;
  }

  Future<void> updateProfile(Profile profile) async {
    return users
        .doc(uid)
        .set(profile.toMap())
        .then((value) => print("Profile updated"))
        .catchError((error) => print("Failed to update profile: $error"));
  }
}
