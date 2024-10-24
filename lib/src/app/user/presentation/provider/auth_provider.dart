import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUsecase authUsecase;
  AuthProvider(this.authUsecase);

  bool registerUser = false;
  bool loginUser = false;
  bool checkRemember = false;

  signUp(String email, String password, String fullName, String phone) async {
    final response = await authUsecase.signUp(email, password, fullName, phone);

    if (response != null) {
      registerUser = true;
      Logger().i(response.user?.id);
    }
    notifyListeners();
  }

  signIn(String email, String password) async {
    final response = await authUsecase.signIn(email, password);

    if (response?.session?.accessToken != null) {
      loginUser = true;
      Logger().i(response?.user?.id);
    }
    notifyListeners();
  }

  signOut() async {
    await authUsecase.signOut();
    notifyListeners();
  }

  rememberMe() {
    checkRemember = !checkRemember;
    notifyListeners();
  }
}
