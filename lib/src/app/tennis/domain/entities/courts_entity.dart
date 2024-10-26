import 'package:equatable/equatable.dart';

class CourtsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? location;
  final String? surfaceType;
  final String? image;
  final int? price;
  final int? start;
  final String? startString;
  final int? end;
  final String? endString;

  const CourtsEntity({
    this.id,
    this.name,
    this.location,
    this.surfaceType,
    this.image,
    this.price,
    this.start,
    this.startString,
    this.end,
    this.endString,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        surfaceType,
        image,
        price,
        start,
        startString,
        end,
        endString,
      ];
}
