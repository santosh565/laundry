import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<String?> get userUid {
    return _auth.authStateChanges().map(_idFromFirebaseUser);
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
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _idFromFirebaseUser(result.user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // register with email and password
  Future<User?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

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
