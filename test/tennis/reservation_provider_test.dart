import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/reservation_repository_mock.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/reservation_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/reservation_usecase.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';

void main() {
  group('ReservationProvider', () {
    test('Evaluar reserva', () async {
      WidgetsFlutterBinding.ensureInitialized();
      final provider = ReservationProvider(
          reservationUsecase:
              ReservationUsecase(repository: ReservationRepositoryMock()));

      final response = await provider.evaluateReservation(1, '2022-01-01');
      expect(response, isA<Map<String, dynamic>>());
      expect(response['status'], 'success');
    });

    test('Obtener reservas', () async {
      WidgetsFlutterBinding.ensureInitialized();
      final provider = ReservationProvider(
          reservationUsecase:
              ReservationUsecase(repository: ReservationRepositoryMock()));

      await provider.getReservations();
      expect(provider.reservations, isA<List<ReservationEntity>>());
      expect(provider.reservations.isNotEmpty, isTrue);
      expect(provider.myReservations, isA<List<ReservationEntity>>());
      expect(provider.myReservations.isNotEmpty, isFalse);
      expect(provider.myReservationsFavorites, isA<List<ReservationEntity>>());
      expect(provider.myReservationsFavorites.isNotEmpty, isFalse);
    });

    test('Obtener reserva por id', () async {
      WidgetsFlutterBinding.ensureInitialized();
      final provider = ReservationProvider(
          reservationUsecase:
              ReservationUsecase(repository: ReservationRepositoryMock()));

      await provider.getReservationById(1);
      expect(provider.reservation, isA<ReservationEntity>());
      expect(provider.reservation!.id!, 1);
    });
  });
}
