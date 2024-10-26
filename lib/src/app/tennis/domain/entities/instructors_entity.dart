import 'package:equatable/equatable.dart';

class InstructorsEntity extends Equatable {
  final int? id;
  final String? name;
  const InstructorsEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
