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
  final int? endTime;
  final bool? favorite; //!
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
    this.endTime,
    this.favorite, //!
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
        endTime,
        favorite, //!
        courts,
        customers,
        instructors,
        timePlay,
        totalPrice,
      ];
}
