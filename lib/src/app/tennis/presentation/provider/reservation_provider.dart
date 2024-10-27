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
  ReservationEntity? reservation;
  ReservationEntity? createdReservation;

  // bool isEvaluated = false;
  int totalPrice = 0;
  int timePlay = 0;

  isEvaluatedData(int totalPrice, int timePlay) {
    this.totalPrice = totalPrice;
    this.timePlay = timePlay;
    notifyListeners();
  }

  Future<Map<String, dynamic>> evaluateReservation() async {
    final response = await reservationUsecase.evaluateReservation(
        court!.id!, date!.toIso8601String());
    Logger().d(response);
    return response;
  }

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
    myReservations =
        reservations.where((x) => x.customerId == MyStorage().uid).toList();
    notifyListeners();
  }

  getReservationById(int id) async {
    reservations = await reservationUsecase.getReservations();
    reservation = reservations.firstWhere((x) => x.id == id);
    Logger().d(reservation);
    notifyListeners();
  }

  deleteReservation(int id) async {
    await reservationUsecase.deleteReservation(id);
    getReservations();
    notifyListeners();
  }
}
