import 'package:equatable/equatable.dart';

class CourtsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? location;
  final String? surfaceType;
  final String? image;
  final int? price;
  final int? start;
  final int? end;

  const CourtsEntity(
    this.id,
    this.name,
    this.location,
    this.surfaceType,
    this.image,
    this.price,
    this.start,
    this.end,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        surfaceType,
        image,
        price,
        start,
        end,
      ];
}
