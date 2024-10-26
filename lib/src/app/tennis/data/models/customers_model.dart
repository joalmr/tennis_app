import 'package:tennis_app/src/app/tennis/domain/entities/customers_entity.dart';

class CustomersModel extends CustomersEntity {
  const CustomersModel({
    super.id,
    super.name,
    super.email,
    super.phone,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) {
    return CustomersModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
