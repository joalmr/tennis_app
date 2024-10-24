import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';

class InstructorsModel extends InstructorsEntity {
  const InstructorsModel(
    super.id,
    super.name,
  );

  factory InstructorsModel.fromJson(Map<String, dynamic> json) {
    return InstructorsModel(
      json['id'] as int,
      json['name'] as String,
    );
  }

  InstructorsModel copyWith({
    int? id,
    String? name,
  }) {
    return InstructorsModel(
      id ?? this.id,
      name ?? this.name,
    );
  }
}
