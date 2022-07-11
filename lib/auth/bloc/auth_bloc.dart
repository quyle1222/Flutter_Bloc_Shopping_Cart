// ignore_for_file: prefer_single_quotes, prefer_const_constructors

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/auth/auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading()) {
    on<AuthStarted>(_onStarted);
    on<AuthSubmit>(_onSubmit);
    on<AuthChange>(_onChange);
    on<AuthLogin>(_onLogin);
  }

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    try {
      emit(AuthLoaded(auth: Auth(id: "quyle1222", password: "1233456")));
    } catch (_) {
      emit(AuthError());
    }
  }

  void _onSubmit(AuthSubmit event, Emitter<AuthState> emit) {
    final auth = event.auth;
    emit(AuthLoading());
    try {
      emit(AuthLoaded(auth: auth));
    } catch (_) {
      emit(AuthError());
    }
  }

  void _onChange(AuthChange event, Emitter<AuthState> emit) {
    final email = event.email;
    final password = event.password;
    emit(AuthLoading());
    try {
      emit(AuthLoaded(auth: Auth(id: email, password: password)));
    } catch (_) {
      emit(AuthError());
    }
  }

  void _onLogin(AuthLogin event, Emitter<AuthState> emit) {
    final email = event.props!.id;
    final password = event.props!.password;
    emit(AuthLoading());
    try {
      bool _isLogin;
      if (email == "admin" && password == "123456") {
        _isLogin = true;
      } else {
        _isLogin = false;
      }
      emit(AuthLoaded(
          auth: Auth(id: email, password: password), isSuccess: _isLogin));
    } catch (_) {
      emit(AuthError());
    }
  }
}
