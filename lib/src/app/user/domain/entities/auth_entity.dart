import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  const AuthEntity(
    this.id,
    this.name,
    this.email,
    this.phone,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
      ];
}
