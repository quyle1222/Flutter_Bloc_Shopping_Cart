part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {
  List<Object> get props => [];
}

class AuthSubmit extends AuthEvent {
  const AuthSubmit(this.auth);
  final Auth auth;
  List<Object> get props => [auth];
}

class AuthChange extends AuthEvent {
  const AuthChange({required this.email, required this.password});
  final String email;
  final String password;
  List<Object> get props => [email, password];
}
