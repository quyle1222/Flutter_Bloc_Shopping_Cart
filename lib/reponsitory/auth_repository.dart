import 'package:flutter_shopping_cart/auth/models/auth_model.dart';

class AuthRepository {
  Auth data = const Auth();

  void changeData(String id, String password) {
    data = Auth(id: id, password: password);
  }
}
