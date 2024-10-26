import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/reservation_usecase.dart';

class ReservationProvider extends ChangeNotifier {
  final ReservationUsecase reservationUsecase;

  ReservationProvider({required this.reservationUsecase}) {
    date = DateTime.now();
    getReservations();
  }

  CourtsEntity? court;
  int? instructor;
  DateTime? date;
  int? timeStart;
  int? timeEnd;

  List<ReservationEntity> reservations = [];

  createReservation(String comment) async {
    var createReservation = ReservationEntity(
      customerId: 'eda706ec-4455-43f9-a1e0-c8ecfeea0b70',
      courtId: court!.id,
      instructorId: instructor!,
      reservationDate: date!.toIso8601String(),
      comment: comment,
      startTime: timeStart!,
      endTime: timeEnd!,
    );
    await reservationUsecase.createReservation(createReservation);
  }

  getReservations() async {
    reservations = await reservationUsecase.getReservations();
    notifyListeners();
  }
}
