import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Ezbill1FirebaseUser {
  Ezbill1FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Ezbill1FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Ezbill1FirebaseUser> ezbill1FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Ezbill1FirebaseUser>(
        (user) => currentUser = Ezbill1FirebaseUser(user));
