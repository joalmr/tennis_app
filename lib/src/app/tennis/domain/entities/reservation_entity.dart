import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/customers_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';

class ReservationEntity extends Equatable {
  final int? id;
  final String? customerId;
  final int? courtId;
  final int? instructorId;
  final String? reservationDate;
  final String? comment;
  final int? startTime;
  final int? endTime; //!
  // final String? courts;
  final CourtsEntity? courts;
  final CustomersEntity? customers;
  final InstructorsEntity? instructors;
  final int? timePlay;
  final int? totalPrice;

  const ReservationEntity({
    this.id,
    this.customerId,
    this.courtId,
    this.instructorId,
    this.reservationDate,
    this.comment,
    this.startTime,
    this.endTime, //!
    this.courts,
    this.customers,
    this.instructors,
    this.timePlay,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        courtId,
        instructorId,
        reservationDate,
        comment,
        startTime,
        endTime, //!
        courts,
        customers,
        instructors,
        timePlay,
        totalPrice,
      ];
}
