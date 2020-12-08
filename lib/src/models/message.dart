import 'package:felix_core/src/models/user.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
    id: 0, name: 'Current User', imageUrl: 'assets/images/glasses_guy.jpg');

// USERS
final User john = User(id: 1, name: 'John', imageUrl: 'assets/images/john.jpg');
final User kareem =
    User(id: 1, name: 'Kareem', imageUrl: 'assets/images/kareem.jpg');
final User olaseni =
    User(id: 1, name: 'Olaseni', imageUrl: 'assets/images/olaseni.jpg');
final User hamza =
    User(id: 1, name: 'Hamza', imageUrl: 'assets/images/hamza.jpg');
final User daquan =
    User(id: 1, name: 'Daquan', imageUrl: 'assets/images/glasses_guy.jpg');
final User olivia =
    User(id: 1, name: 'Olivia', imageUrl: 'assets/images/glasses_lady.jpg');

// FAVORITE CONTACTS
List<User> favorites = [
  john,
  kareem,
  olaseni,
  hamza,
];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: john,
    time: '5:30 PM',
    text: 'How are you liking it so far?!',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: kareem,
    time: '4:30 PM',
    text: 'You like how this app is designed don\'t you?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: olaseni,
    time: '3:30 PM',
    text: 'What did you think of the Felix Core report?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: hamza,
    time: '2:30 PM',
    text: 'The app actually works right?!',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: daquan,
    time: '1:30 PM',
    text: 'Do you know when campus will open back up?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: olivia,
    time: '12:30 PM',
    text: 'Don\'t forget to knock out that assignment that\'s due tomorrow',
    isLiked: false,
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: john,
    time: '5:30 PM',
    text: 'How are you liking it so far?!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Okay, I just downloaded the new update!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: john,
    time: '3:45 PM',
    text: 'Oh, you should have received another update!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: john,
    time: '3:15 PM',
    text: 'Thank you! There were many sleepless nights, just know that.',
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! I can\'t wait! I loved your team\'s presentation by the way!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: john,
    time: '2:00 PM',
    text: 'We\'re close to getting Felix Core completely up and running!',
    isLiked: false,
    unread: false,
  ),
];
