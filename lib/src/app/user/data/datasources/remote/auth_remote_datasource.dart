import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponse?> signUp(
    String email,
    String password,
    String fullName,
    String phone,
  );
  Future<AuthResponse?> signIn(String email, String password);
  Future<void> signOut();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthResponse?> signUp(
    String email,
    String password,
    String fullName,
    String phone,
  ) async {
    final AuthResponse response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        "full_name": fullName,
        "phone": phone,
      },
    );

    if (response.user != null) {
      await supabase.from('customers').insert({
        'id': response.user?.id,
        'name': fullName,
        'email': response.user?.email,
        'phone': phone,
      });
    }

    return response;
  }

  @override
  Future<AuthResponse?> signIn(String email, String password) async {
    final AuthResponse response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response;
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
