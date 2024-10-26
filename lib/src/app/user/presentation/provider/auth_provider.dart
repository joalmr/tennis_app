import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';
import 'package:tennis_app/src/shared/storage.data.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUsecase authUsecase;
  AuthProvider({required this.authUsecase});

  bool registerUser = false;
  bool loginUser = false;
  // bool checkRemember = false;
  bool togglePasswordVisibility = true;
  bool togglePasswordVisibilityRepeat = true;

  signUp(String email, String password, String fullName, String phone) async {
    final response = await authUsecase.signUp(email, password, fullName, phone);

    if (response != null) {
      registerUser = true;
      MyStorage().uid = response.user!.id;
      MyStorage().name =
          response.user!.userMetadata!['full_name'].toString().split(' ')[0];
    }
    notifyListeners();
  }

  signIn(String email, String password) async {
    final response = await authUsecase.signIn(email, password);

    if (response != null) {
      loginUser = true;
      MyStorage().uid = response.user!.id;
      MyStorage().name =
          response.user!.userMetadata!['full_name'].toString().split(' ')[0];
    }
    notifyListeners();
  }

  signOut() async {
    await authUsecase.signOut();
    MyStorage().uid = '';
    MyStorage().name = '';
  }

  togglePassword() {
    togglePasswordVisibility = !togglePasswordVisibility;
    notifyListeners();
  }

  togglePasswordRepeat() {
    togglePasswordVisibilityRepeat = !togglePasswordVisibilityRepeat;
    notifyListeners();
  }
}
