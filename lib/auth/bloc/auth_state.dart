part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
  Auth? get props => null;
  bool? get isLogin => null;
}

class AuthLoading extends AuthState {
  @override
  Auth? get props => null;
}

class AuthLoaded extends AuthState {
  const AuthLoaded(
      {this.auth = const Auth(id: '', password: ''), this.isSuccess = false});
  final Auth auth;
  final bool isSuccess;

  @override
  Auth get props => auth;
  @override
  bool? get isLogin => isSuccess;
}

class AuthError extends AuthState {
  @override
  Auth? get props => null;
}
