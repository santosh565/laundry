import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth provider) : super(const InitialState()) {
    on<AppStartEvent>((event, emit) {
      final User? user = provider.currentUser;
      if (user != null) {
        emit(LoggedInState(user));
      } else {
        emit(const LoggedOutState());
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(const LoadingState());
      try {
        final UserCredential userCredential =
            await provider.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        final User? user = userCredential.user;
        if (user != null) {
          emit(LoggedInState(user));
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
    on<LogoutEvent>(
      (event, emit) async {
        emit(const LoadingState());
        try {
          await provider.signOut();
          emit(const LoggedOutState());
        } catch (e) {
          emit(FailureState(e.toString()));
        }
      },
    );

    on<RegisterEvent>((event, emit) async {
      emit(const LoadingState());
      // try {
      //   final UserCredential userCredential =
      //       await provider.createUserWithEmailAndPassword(
      //     email: event.email,
      //     password: event.password,
      //   );
      //   final User? user = userCredential.user;
      //   if (user != null) {
      //     emit(LoggedInState(user));
      //   }
      // } catch (e) {
      //   emit(FailureState(e.toString()));
      // }
    });
  }
}
