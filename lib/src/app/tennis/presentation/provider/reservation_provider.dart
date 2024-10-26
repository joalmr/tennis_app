import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/reservation_usecase.dart';
import 'package:tennis_app/src/shared/storage.data.dart';

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
  List<ReservationEntity> myReservations = [];
  ReservationEntity? createdReservation;

  createReservation(String comment) async {
    var createReservation = ReservationEntity(
      customerId: MyStorage().uid,
      courtId: court!.id,
      instructorId: instructor!,
      reservationDate: date!.toIso8601String(),
      comment: comment,
      startTime: timeStart!,
      endTime: timeEnd!,
    );
    createdReservation =
        await reservationUsecase.createReservation(createReservation);
    getReservations();
    notifyListeners();
  }

  getReservations() async {
    reservations = await reservationUsecase.getReservations();
    Logger().w(reservations.length, error: 'reservations');
    notifyListeners();
  }

  getMyReservations() async {
    myReservations =
        reservations.where((x) => x.customerId == MyStorage().uid).toList();
    Logger().w(myReservations.length, error: 'my reservations');
    notifyListeners();
  }
}
