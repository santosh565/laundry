part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}


class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class AppStartEvent extends AuthEvent {
  const AppStartEvent();
}
