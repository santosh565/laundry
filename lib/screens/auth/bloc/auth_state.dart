part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class LoadingState extends AuthState {
  const LoadingState();
}

class InitialState extends AuthState {
  const InitialState();
}

class LoggedInState extends AuthState {
  final User user;

  const LoggedInState(this.user);
}

class FailureState extends AuthState {
  final String error;

  const FailureState(this.error);
}

class LoggedOutState extends AuthState {
  const LoggedOutState();
}
