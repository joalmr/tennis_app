import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/user/domain/repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase({required this.repository});

  Future<AuthResponse?> signUp(
      String email, String password, String fullName, String phone) async {
    return repository.signUp(email, password, fullName, phone);
  }

  Future<AuthResponse?> signIn(String email, String password) async {
    return repository.signIn(email, password);
  }

  Future<void> signOut() async {
    return repository.signOut();
  }
}
