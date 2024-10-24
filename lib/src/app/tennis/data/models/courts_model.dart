import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';

class CourtsModel extends CourtsEntity {
  const CourtsModel(
    super.id,
    super.name,
    super.location,
    super.surfaceType,
    super.image,
    super.start,
    super.end,
    super.price,
  );

  factory CourtsModel.fromJson(Map<String, dynamic> json) {
    return CourtsModel(
      json['id'] as int,
      json['name'] as String,
      json['location'] as String,
      json['surfaceType'] as String,
      json['image'] as String,
      json['price'] as int,
      json['start'] as int,
      json['end'] as int,
    );
  }

  CourtsModel copyWith({
    int? id,
    String? name,
    String? location,
    String? surfaceType,
    String? image,
    int? price,
    int? start,
    int? end,
  }) {
    return CourtsModel(
      id ?? this.id,
      name ?? this.name,
      location ?? this.location,
      surfaceType ?? this.surfaceType,
      image ?? this.image,
      price ?? this.price,
      start ?? this.start,
      end ?? this.end,
    );
  }
}
