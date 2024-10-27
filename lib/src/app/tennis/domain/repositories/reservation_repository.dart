import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<List<ReservationEntity>> getReservations();
  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate);
  Future<ReservationEntity?> createReservation(ReservationEntity reservation);
  Future<void> deleteReservation(int id);
}
