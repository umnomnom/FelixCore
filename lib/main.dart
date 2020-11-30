import 'dart:async';

import 'package:felix_core/src/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:felix_core/src/landingPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  MyApp({this.app});
  final FirebaseApp app;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Felix Core',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyText2: GoogleFonts.montserrat(textStyle: textTheme.button),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
