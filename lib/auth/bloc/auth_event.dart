part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
  Auth? get props => null;
  bool get isSuccess => false;
}

class AuthStarted extends AuthEvent {
  @override
  Auth? get props => null;
}

class AuthSubmit extends AuthEvent {
  const AuthSubmit(this.auth);
  final Auth auth;
  @override
  Auth get props => auth;
}

class AuthChange extends AuthEvent {
  const AuthChange({required this.email, required this.password});
  final String email;
  final String password;
  @override
  Auth get props => Auth(id: email, password: password);
}

class AuthLogin extends AuthEvent {
  const AuthLogin({required this.auth});
  final Auth auth;
  @override
  Auth? get props => auth;
}
