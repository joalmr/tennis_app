import 'package:tennis_app/src/app/tennis/data/datasources/remote/reservation_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDatasource remoteDatasource;

  ReservationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate) async {
    return await remoteDatasource.evaluateReservation(courtId, reservationDate);
  }

  @override
  Future<ReservationEntity?> createReservation(
      ReservationEntity reservation) async {
    return await remoteDatasource.createReservation(reservation);
  }

  @override
  Future<List<ReservationEntity>> getReservations() async {
    return await remoteDatasource.getReservations();
  }

  @override
  Future<void> deleteReservation(int id) async {
    return await remoteDatasource.deleteReservation(id);
  }
}
