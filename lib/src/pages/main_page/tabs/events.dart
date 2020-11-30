import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:felix_core/src/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(EventsTab());
const title = 'Events';

class EventsTab extends StatelessWidget {
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
      ),
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

class TeamsList extends StatelessWidget {
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
            return Text("Loading Teams");
          }

          var entries = snapshot.data.data().entries;

          return new GridView.count(
            crossAxisCount: 2,
            children: List.generate(entries.length, (index) {
              var name = entries.elementAt(index).key;
              return Center(
                child: Text(
                  'Team $name',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
          );
        });
  }
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
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Search',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            // onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(7, (index) {
          return Center(
            child: Text(
              'Event $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      ),
    );
  }
}
