import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryImpl {
  Stream<User?> get user;

  Future<User?> login({
    required String email,
    required String password,
  });

  Future<User?> signInAnon();

  Future<User?> register({
    required String email,
    required String password,
  });

  Future<void> signOut();


}
