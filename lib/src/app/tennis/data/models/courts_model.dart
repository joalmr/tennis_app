import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';

class CourtsModel extends CourtsEntity {
  const CourtsModel({
    super.id,
    super.name,
    super.location,
    super.surfaceType,
    super.image,
    super.price,
    super.start,
    super.startString,
    super.end,
    super.endString,
  });

  factory CourtsModel.fromJson(Map<String, dynamic> json) {
    return CourtsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      location: json['location'] as String,
      surfaceType: json['surface_type'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      start: json['start'] as int,
      startString: json['start'] as int > 12
          ? "${json['start'] - 12}:00 pm"
          : "${json['start']}:00 am",
      end: json['end'] as int,
      endString: json['end'] as int > 12
          ? "${json['end'] - 12}:00 pm"
          : "${json['end']}:00 am",
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
    String? startString,
    int? end,
    String? endString,
  }) {
    return CourtsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      surfaceType: surfaceType ?? this.surfaceType,
      image: image ?? this.image,
      price: price ?? this.price,
      start: start ?? this.start,
      startString: startString ?? this.startString,
      end: end ?? this.end,
      endString: endString ?? this.endString,
    );
  }
}
