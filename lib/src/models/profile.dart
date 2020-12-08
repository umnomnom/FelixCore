import 'package:meta/meta.dart';

class Profile {
  Profile({@required this.name, @required this.events});

  final String name;
  final String events;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'events': events,
    };
  }

  factory Profile.fromMap(Map data) {
    return Profile(
      name: data['name'] as String,
      events: data['events'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.events} }';
  }
}
