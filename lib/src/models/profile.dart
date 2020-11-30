import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Profile {
  Profile({
    @required this.name,
    @required this.email,
    @required this.profilePicture,
    @required this.teams,
    @required this.bio
  });

  final String name;
  final String email;
  final String profilePicture;
  final String teams;
  final String bio;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
      'teams': teams,
      'bio': bio,
    };
  }

  factory Profile.fromJson(dynamic json) {
    return Profile(
      name: json['name'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
      teams: json['teams'] as String,
      bio: json['bio'] as String,
    );
  }

  factory Profile.fromMap(Map data) {
    return Profile(
      name: data['name'] as String,
      email: data['email'] as String,
      profilePicture: data['profilePicture'] as String,
      teams: data['teams'] as String,
      bio: data['bio'] as String,
    );
  }

  factory Profile.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Profile(
      name: data['name'] as String,
      email: data['email'] as String,
      profilePicture: data['profilePicture'] as String,
      teams: data['teams'] as String,
      bio: data['bio'] as String,
    );
  }
  
  @override
  String toString() {
    return '{ ${this.name}, ${this.email} }';
  }
}