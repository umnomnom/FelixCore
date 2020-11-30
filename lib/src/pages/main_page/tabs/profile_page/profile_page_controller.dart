import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felix_core/src/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserName extends StatelessWidget {
  UserName({@required this.textStyle});
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return StreamBuilder<DocumentSnapshot>(
        stream: database.getProfileStream(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new Text(
            //snapshot.data.data()['name'],
            'Will Smith',
            style: textStyle,
          );
        });
  }
}

class UserEmail extends StatelessWidget {
  UserEmail({@required this.textStyle});
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return StreamBuilder<DocumentSnapshot>(
        stream: database.getProfileStream(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new Text(
            //snapshot.data.data()['email'],
            'WillSmith@JadaRedTable.com',
            style: textStyle,
          );
        });
  }
}

class UserBio extends StatelessWidget {
  UserBio({@required this.textStyle});
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return StreamBuilder<DocumentSnapshot>(
        stream: database.getProfileStream(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new Text(
            //snapshot.data.data()['bio'],
            'I am Will Smith. Look at my email.',
            style: textStyle,
          );
        });
  }
}
