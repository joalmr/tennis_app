import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/customers_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/reservation_repository.dart';

class ReservationRepositoryMock implements ReservationRepository {
  @override
  Future<ReservationEntity?> createReservation(ReservationEntity reservation) {
    return Future.value(ReservationEntity(
      id: 1,
      courtId: reservation.courtId,
      reservationDate: reservation.reservationDate,
      customerId: reservation.customerId,
      instructorId: reservation.instructorId,
      startTime: reservation.startTime,
      endTime: reservation.endTime,
      comment: reservation.comment,
      favorite: reservation.favorite,
      timePlay: reservation.timePlay,
      totalPrice: reservation.totalPrice,
      courts: reservation.courts,
      customers: reservation.customers,
      instructors: reservation.instructors,
    ));
  }

  @override
  Future<void> deleteReservation(int id) {
    return Future.value();
  }

  @override
  Future<Map<String, dynamic>> evaluateReservation(
      int courtId, String reservationDate) {
    return Future.value({
      'status': 'success',
      'message': 'Reserva correcta',
    });
  }

  @override
  Future<List<ReservationEntity>> getReservations() {
    return Future.value([
      const ReservationEntity(
        id: 1,
        courtId: 1,
        reservationDate: '2022-01-01',
        customerId: '1',
        instructorId: 1,
        startTime: 10,
        endTime: 12,
        comment: 'comment',
        favorite: false,
        timePlay: 10,
        totalPrice: 100,
        courts: CourtsEntity(
          id: 1,
          name: 'Court 1',
          location: 'Location 1',
          image: 'https://example.com/court1.jpg',
          surfaceType: 'Grass',
          price: 50,
          start: 10,
          startString: '10:00',
          end: 20,
          endString: '20:00',
        ),
        customers: CustomersEntity(
          id: 'asdw',
          name: 'name',
          email: 'email',
          phone: 'phone',
        ),
        instructors: InstructorsEntity(
          id: 1,
          name: 'Carlos Marin',
        ),
      ),
      const ReservationEntity(
          id: 2,
          courtId: 2,
          reservationDate: '2022-01-01',
          customerId: '2',
          instructorId: 2,
          startTime: 10,
          endTime: 12,
          comment: 'comment',
          favorite: true,
          timePlay: 10,
          totalPrice: 100,
          courts: CourtsEntity(
            id: 2,
            name: 'Court 2',
            location: 'Location 2',
            image: 'https://example.com/court2.jpg',
            surfaceType: 'Clay',
            price: 40,
            start: 15,
            startString: '15:00',
            end: 22,
            endString: '22:00',
          ),
          customers: CustomersEntity(
            id: 'asdw',
            name: 'name',
            email: 'email',
            phone: 'phone',
          ),
          instructors: InstructorsEntity(
            id: 2,
            name: 'Juan Perez',
          ))
    ]);
  }
}
