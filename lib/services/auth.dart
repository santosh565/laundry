import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<String?> get userUid {
    return _auth.authStateChanges()    
    .map(_idFromFirebaseUser);
  }

  // sing in annonomously
  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      return _idFromFirebaseUser(result.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // create user obj based on firebase user
  String? _idFromFirebaseUser(User? user) {
    return user?.uid;
  }

  // sign in with email and password

  // register with email and password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
