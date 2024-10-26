import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';

class InstructorsModel extends InstructorsEntity {
  const InstructorsModel({
    super.id,
    super.name,
  });

  factory InstructorsModel.fromJson(Map<String, dynamic> json) {
    return InstructorsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  InstructorsModel copyWith({
    int? id,
    String? name,
  }) {
    return InstructorsModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
