import 'package:tennis_app/src/app/user/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel(
    super.id,
    super.name,
    super.email,
    super.phone,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      json['id'] ?? '',
      json['name'] ?? '',
      json['email'] ?? '',
      json['phone'] ?? '',
    );
  }

  AuthModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) {
    return AuthModel(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      phone ?? this.phone,
    );
  }
}
