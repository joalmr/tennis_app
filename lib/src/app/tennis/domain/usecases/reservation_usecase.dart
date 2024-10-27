import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/reservation_repository.dart';

class ReservationUsecase {
  final ReservationRepository repository;

  ReservationUsecase({required this.repository});

  Future<List<ReservationEntity>> getReservations() {
    return repository.getReservations();
  }

  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate) {
    return repository.evaluateReservation(courtId, reservationDate);
  }

  Future<ReservationEntity?> createReservation(ReservationEntity reservation) {
    return repository.createReservation(reservation);
  }

  Future<void> deleteReservation(int id) {
    return repository.deleteReservation(id);
  }
}
