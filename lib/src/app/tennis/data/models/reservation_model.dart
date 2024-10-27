import 'package:tennis_app/src/app/tennis/data/models/courts_model.dart';
import 'package:tennis_app/src/app/tennis/data/models/customers_model.dart';
import 'package:tennis_app/src/app/tennis/data/models/instructors_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/customers_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

class ReservationModel extends ReservationEntity {
  const ReservationModel({
    super.id,
    super.customerId,
    super.courtId,
    super.instructorId,
    super.reservationDate,
    super.comment,
    super.startTime,
    super.endTime,
    super.favorite, //!
    super.courts,
    super.customers,
    super.instructors,
    super.timePlay,
    super.totalPrice,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      customerId: json['customer_id'],
      courtId: json['court_id'],
      instructorId: json['instructor_id'],
      reservationDate: json['reservation_date'],
      comment: json['comment'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      favorite: json['favorite'] ?? false, //
      courts: json['courts'] == null
          ? null
          : CourtsModel.fromJson(json['courts']), //!
      customers: json["customers"] == null
          ? null
          : CustomersModel.fromJson(json["customers"]),
      instructors: json["instructors"] == null
          ? null
          : InstructorsModel.fromJson(json["instructors"]),
      timePlay: json['end_time'] - json['start_time'],
      totalPrice: json['courts'] == null
          ? null
          : (json['end_time'] - json['start_time']) * json['courts']['price'],
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
      'favorite': favorite,
    };
  }

  factory ReservationModel.fromEntity(ReservationEntity reservation) {
    return ReservationModel(
      customerId: reservation.customerId,
      courtId: reservation.courtId,
      instructorId: reservation.instructorId,
      reservationDate: reservation.reservationDate,
      comment: reservation.comment,
      startTime: reservation.startTime,
      endTime: reservation.endTime,
      favorite: reservation.favorite, //!
    );
  }

  ReservationModel copyWith({
    int? id,
    String? customerId,
    int? courtId,
    int? instructorId,
    String? reservationDate,
    String? comment,
    int? startTime,
    int? endTime,
    bool? favorite, //!
    CourtsEntity? courts,
    CustomersEntity? customers,
    InstructorsEntity? instructors,
    int? timePlay,
    int? totalPrice,
  }) {
    return ReservationModel(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      courtId: courtId ?? this.courtId,
      instructorId: instructorId ?? this.instructorId,
      reservationDate: reservationDate ?? this.reservationDate,
      comment: comment ?? this.comment,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      favorite: favorite ?? this.favorite, //!
      courts: courts ?? this.courts,
      customers: customers ?? this.customers,
      instructors: instructors ?? this.instructors,
      timePlay: timePlay ?? this.timePlay,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
