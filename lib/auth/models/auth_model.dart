import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Auth extends Equatable {
  const Auth({this.id = '', this.password = ''});
  final String id;
  final String password;

  @override
  List<Object> get props => [id, password];

  @override
  bool get stringify => true;
}
