import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tennis_app/src/app/tennis/data/models/reservation_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';

abstract class ReservationRemoteDatasource {
  Future<List<ReservationModel>> getReservations();
  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate);
  Future<ReservationModel?> createReservation(ReservationEntity reservation);
  Future<void> deleteReservation(int id);
}

class ReservationRemoteDatasourceImpl implements ReservationRemoteDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate) async {
    final evaluateReservation = await supabase
        .from('reservations')
        .select('*')
        .eq('court_id', courtId)
        .eq('reservation_date', reservationDate);

    if (evaluateReservation.length >= 3) {
      return {
        'status': 'error',
        'message': 'Esta cancha ya tiene tres reservas en este día',
      };
    } else {
      return {
        'status': 'success',
        'message': 'Reserva exitosa',
      };
    }
  }

  @override
  Future<ReservationModel?> createReservation(
      ReservationEntity reservation) async {
    final response = await supabase.from('reservations').insert([
      ReservationModel.fromEntity(reservation).toJson(),
    ]).select();

    return ReservationModel.fromJson(response.first);
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
    favorite,
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

  @override
  Future<void> deleteReservation(int id) async {
    await supabase.from('reservations').delete().eq('id', id);
  }
}
