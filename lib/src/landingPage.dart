import 'package:felix_core/src/pages/login_signup_page/welcomePage.dart';
import 'package:felix_core/src/pages/main_page/main_page.dart';
import 'package:felix_core/src/services/auth.dart';
import 'package:felix_core/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return WelcomePage.create(context);
            }
            return Provider<Database>(
              create: (_) => DatabaseService(uid: user.uid),
              child: MainPage(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 100.0,
      height: 100.0,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[800]),
      child: Icon(
        Icons.restaurant,
        color: Colors.white,
        size: 40.0,
      ),
    );
  }
}
