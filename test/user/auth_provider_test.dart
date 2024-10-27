import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/user/data/repositories/auth_repository_mock.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final authProvider =
      AuthProvider(authUsecase: AuthUsecase(repository: AuthRepositoryMock()));

  group('AuthProvider', () {
    test('Validar signIn correcto', () async {
      final response = await authProvider.signIn('joalmr@gmail.com', '1234');
      expect(response, isA<AuthResponse>());
    });

    test('Validar signIn incorrecto', () async {
      final response = await authProvider.signIn('joalmr@gmail.com', '');
      expect(response, isA<Map<String, dynamic>>());
      expect(response['status'], 'error');
      expect(response['message'], 'Existen campos vacios');
    });

    test('Validar signUp correcto', () async {
      final response = await authProvider.signUp(
        'joalmr@gmail.com',
        '1234567',
        '1234567',
        'Alonso Massa',
        '51993926739',
      );
      expect(response, isA<Map<String, dynamic>>());
      expect(response['status'], 'success');
    });

    test('Validar signUp incorrecto', () async {
      final response = await authProvider.signUp(
        'joalmr@gmail.com',
        '1234567',
        '1234567dsad',
        'Alonso Massa',
        '51993926739',
      );
      expect(response, isA<Map<String, dynamic>>());
      expect(response['status'], 'error');
      expect(response['message'], 'Las contraseñas no coinciden');
    });
  });
}
