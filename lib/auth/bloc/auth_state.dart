part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthLoading extends AuthState {
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  const AuthLoaded({this.auth = const Auth(id: '', password: '')});
  final Auth auth;
  List<Object> get props => [auth];
}

class AuthError extends AuthState {
  List<Object> get props => [];
}
