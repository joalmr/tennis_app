import 'package:tennis_app/src/app/tennis/data/datasources/remote/reservation_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDatasource remoteDatasource;

  ReservationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<ReservationEntity?> createReservation(
      ReservationEntity reservation) async {
    return await remoteDatasource.createReservation(reservation);
  }

  @override
  Future<List<ReservationEntity>> getReservations() async {
    return await remoteDatasource.getReservations();
  }
}
