import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';

class FavoriteCourtsEntity extends Equatable {
  final CourtsEntity? courts;

  const FavoriteCourtsEntity({
    this.courts,
  });

  @override
  List<Object?> get props => [
        courts,
      ];
}
