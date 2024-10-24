import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  const ReservationModel(
    super.id,
    super.customerId,
    super.courtId,
    super.instructorId,
    super.reservationDate,
    super.comment,
    super.startTime,
    super.endTime, //!
    super.court,
    super.surfaceType,
    super.image,
    super.location,
    super.price,
    super.customer,
    super.instructor,
    super.timePlay,
    super.totalPrice,
  );

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      json['id'] as int,
      json['customer_id'] as String,
      json['court_id'] as int,
      json['instructor_id'] as int,
      json['reservation_date'] as String,
      json['comment'] as String,
      json['start_time'] as int,
      json['end_time'] as int, //!
      json['court'] as String,
      json['surface_type'] as String,
      json['image'] as String,
      json['location'] as String,
      json['price'] as int,
      json['customer'] as String,
      json['instructor'] as String,
      json['time_play'] as int,
      json['total_price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'court_id': courtId,
      'instructor_id': instructorId,
      'reservation_date': reservationDate,
      'comment': comment,
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  ReservationModel copyWith({
    int? id,
    String? customerId,
    int? courtId,
    int? instructorId,
    String? reservationDate,
    String? comment,
    int? startTime,
    int? endTime, //!
    String? court,
    String? surfaceType,
    String? image,
    String? location,
    int? price,
    String? customer,
    String? instructor,
    int? timePlay,
    int? totalPrice,
  }) {
    return ReservationModel(
      id ?? this.id,
      customerId ?? this.customerId,
      courtId ?? this.courtId,
      instructorId ?? this.instructorId,
      reservationDate ?? this.reservationDate,
      comment ?? this.comment,
      startTime ?? this.startTime,
      endTime ?? this.endTime, //!
      court ?? this.court,
      surfaceType ?? this.surfaceType,
      image ?? this.image,
      location ?? this.location,
      price ?? this.price,
      customer ?? this.customer,
      instructor ?? this.instructor,
      timePlay ?? this.timePlay,
      totalPrice ?? this.totalPrice,
    );
  }
}
