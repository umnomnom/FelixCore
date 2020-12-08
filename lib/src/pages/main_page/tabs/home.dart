import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felix_core/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(HomeTab());
const title = 'Felix Core';

class HomeTab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          primaryColor: Colors.red,
          accentColor: Color(0xFFFEF9EB),
          cardColor: Color(0xFFFEF9EB)),
      home: MyTeams(title: title),
    );
  }
}

class MyTeams extends StatefulWidget {
  MyTeams({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyTeamsState createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          // Card(
          //   semanticContainer: true,
          //   clipBehavior: Clip.antiAliasWithSaveLayer,
          //   child: Column(
          //     children: <Widget>[
          //       Image.asset(
          //         'assets/images/UDChometab.jpg',
          //         fit: BoxFit.fill,
          //       ),
          //       Text('Welcome to Felix Core!')
          //     ],
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),
          //   elevation: 5,
          //   margin: EdgeInsets.all(10),
          // ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/images/UDChometab.jpg',
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: _buildLeftCard(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Expanded(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: _buildRightCard(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/blackboard_logo.png',
                width: 250,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftCard() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                      height: 1,
                      color: Colors.redAccent,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "unread messages",
                    style: TextStyle(
                      height: 1,
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "John messaged you last",
                    style: TextStyle(
                      height: 1,
                      color: Colors.blueGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      );

  Widget _buildRightCard() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Text(
                    "You have",
                    style: TextStyle(
                      height: 1,
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                      height: 1,
                      color: Colors.redAccent,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "quizzes today",
                    style: TextStyle(
                      height: 1,
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      );
}
