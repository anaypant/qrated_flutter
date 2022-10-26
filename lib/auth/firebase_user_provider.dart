import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QratedFirebaseUser {
  QratedFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

QratedFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QratedFirebaseUser> qratedFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<QratedFirebaseUser>(
      (user) {
        currentUser = QratedFirebaseUser(user);
        return currentUser!;
      },
    );
