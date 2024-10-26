import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/data/models/reservation_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

abstract class ReservationRemoteDatasource {
  Future<List<ReservationModel>> getReservations();
  Future<ReservationModel?> createReservation(ReservationEntity reservation);
}

class ReservationRemoteDatasourceImpl implements ReservationRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<ReservationModel?> createReservation(
      ReservationEntity reservation) async {
    final evaluateReservation = await supabase
        .from('reservations')
        .select('*')
        .eq('court_id', reservation.courtId!)
        .eq('reservation_date', reservation.reservationDate!);

    if (evaluateReservation.length >= 3) {
      return null;
      //TODO: mandar mensaje de error personalizado
    } else {
      final response = await supabase.from('reservations').insert([
        {
          'customer_id': reservation.customerId,
          'court_id': reservation.courtId,
          'instructor_id': reservation.instructorId,
          'reservation_date': reservation.reservationDate,
          'comment': reservation.comment,
          'start_time': reservation.startTime,
          'end_time': reservation.endTime,
        },
      ]).select();

      return ReservationModel.fromJson(response.first);
    }
  }

  @override
  Future<List<ReservationModel>> getReservations() async {
    final response = await supabase
        .from('reservations')
        .select('''
    id,
    customer_id,
    court_id,
    instructor_id,
    reservation_date,
    comment,
    start_time,
    end_time,
    courts(*),
    customers(*),
    instructors(*)
   ''')
        .filter('reservation_date', 'gte', DateTime.now())
        .order('reservation_date', ascending: true);

    final reservations =
        response.map((json) => ReservationModel.fromJson(json)).toList();

    return reservations;
  }
}
