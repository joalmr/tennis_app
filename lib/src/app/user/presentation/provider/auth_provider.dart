import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';
import 'package:tennis_app/src/shared/storage.data.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUsecase authUsecase;
  AuthProvider({required this.authUsecase});

  bool togglePasswordVisibility = true;
  bool togglePasswordVisibilityRepeat = true;

  Future<Map<String, dynamic>> signUp(String email, String password,
      String passwordRepeat, String fullName, String phone) async {
    if (password != passwordRepeat) {
      return {
        'status': 'error',
        'message': 'Las contraseñas no coinciden',
      };
    } else {
      final response =
          await authUsecase.signUp(email, password, fullName, phone);

      if (response != null) {
        MyStorage().uid = response.user!.id;
        MyStorage().name =
            response.user!.userMetadata!['full_name'].toString().split(' ')[0];
      }

      return {
        'status': 'success',
        'message': 'Usuario creado',
      };
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    final response = await authUsecase.signIn(email, password);

    if (email.trim().isEmpty || password.trim().isEmpty) {
      return {
        'status': 'error',
        'message': 'Existen campos vacios',
      };
    }
    if (response != null) {
      MyStorage().uid = response.user!.id;
      MyStorage().name =
          response.user!.userMetadata!['full_name'].toString().split(' ')[0];
    }

    return response;
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
