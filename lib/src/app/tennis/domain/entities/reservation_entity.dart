import 'package:equatable/equatable.dart';

class ReservationEntity extends Equatable {
  final int? id;
  final String? customerId;
  final int? courtId;
  final int? instructorId;
  final String? reservationDate;
  final String? comment;
  final int? startTime;
  final int? endTime; //!
  final String? court;
  final String? surfaceType;
  final String? image;
  final String? location;
  final int? price;
  final String? customer;
  final String? instructor;
  final int? timePlay;
  final int? totalPrice;

  const ReservationEntity(
    this.id,
    this.customerId,
    this.courtId,
    this.instructorId,
    this.reservationDate,
    this.comment,
    this.startTime,
    this.endTime, //!
    this.court,
    this.surfaceType,
    this.image,
    this.location,
    this.price,
    this.customer,
    this.instructor,
    this.timePlay,
    this.totalPrice,
  );

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
        court,
        surfaceType,
        image,
        location,
        price,
        customer,
        instructor,
        timePlay,
        totalPrice,
      ];
}
