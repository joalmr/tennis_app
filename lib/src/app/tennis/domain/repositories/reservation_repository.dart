import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<List<ReservationEntity>> getReservations();
  Future<ReservationEntity?> createReservation(ReservationEntity reservation);
  Future<void> deleteReservation(int id);
}
