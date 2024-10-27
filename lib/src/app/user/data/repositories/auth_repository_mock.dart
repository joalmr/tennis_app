import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/user/domain/repositories/auth_repository.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<AuthResponse?> signIn(String email, String password) {
    final user = User(
      id: 'id',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
    );

    final response = AuthResponse(
      session: Session(
        accessToken: 'asdYupo',
        tokenType: 'asdYupo//99',
        user: user,
      ),
      user: user,
    );

    return Future.value(response);
  }

  @override
  Future<void> signOut() {
    return Future.value();
  }

  @override
  Future<AuthResponse?> signUp(
      String email, String password, String fullName, String phone) {
    final user = User(
      id: 'id',
      appMetadata: {},
      userMetadata: {},
      aud: 'aud',
      createdAt: DateTime.now().toIso8601String(),
    );

    final response = AuthResponse(
      session: Session(
        accessToken: 'asdYupo',
        tokenType: 'asdYupo//99',
        user: user,
      ),
      user: user,
    );

    return Future.value(response);
  }
}
