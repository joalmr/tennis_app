import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/user/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tennis_app/src/app/user/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<AuthResponse?> signUp(
      String email, String password, String fullName, String phone) async {
    return await remoteDatasource.signUp(email, password, fullName, phone);
  }

  @override
  Future<AuthResponse?> signIn(String email, String password) async {
    return await remoteDatasource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    return await remoteDatasource.signOut();
  }
}
