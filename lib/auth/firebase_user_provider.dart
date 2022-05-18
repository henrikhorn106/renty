import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RentyFirebaseUser {
  RentyFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RentyFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RentyFirebaseUser> rentyFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RentyFirebaseUser>((user) => currentUser = RentyFirebaseUser(user));
