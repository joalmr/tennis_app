import 'package:tennis_app/src/app/tennis/data/models/courts_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/favorite_courts_entity.dart';

class FavoriteCourtsModel extends FavoriteCourtsEntity {
  const FavoriteCourtsModel({
    super.courts,
  });

  factory FavoriteCourtsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteCourtsModel(
      courts: json['courts'] != null
          ? CourtsModel.fromJson(json['courts'] as Map<String, dynamic>)
          : null,
    );
  }
}
