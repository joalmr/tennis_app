import 'package:get_it/get_it.dart';
import 'package:tennis_app/src/app/tennis/data/datasources/remote/courts_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/data/datasources/remote/instructors_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/data/datasources/remote/reservation_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/courts_repository_impl.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/instructors_repository_impl.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/reservation_repository_impl.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/courts_repository.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/instructors_repository.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/reservation_repository.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/courts_usecase.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/instructors_usecase.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/reservation_usecase.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/instructors_provider.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/reservation_provider.dart';
import 'package:tennis_app/src/app/user/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tennis_app/src/app/user/data/repositories/auth_repository_impl.dart';
import 'package:tennis_app/src/app/user/domain/repositories/auth_repository.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';

final di = GetIt.instance;

Future<void> init() async {
  //AUTH
  di.registerFactory(() => AuthProvider(authUsecase: di())); //provider
  di.registerLazySingleton(() => AuthUsecase(repository: di())); //usecase
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: di())); //repository
  di.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl()); //datasource

  //Courts
  di.registerFactory(() => CourtsProvider(courtsUsecase: di())); //provider
  di.registerLazySingleton(() => CourtsUsecase(repository: di())); //usecase
  di.registerLazySingleton<CourtsRepository>(
      () => CourtsRepositoryImpl(remoteDatasource: di())); //repository
  di.registerLazySingleton<CourtsRemoteDatasource>(
      () => CourtsRemoteDatasourceImpl()); //datasource

  //Instructors
  di.registerFactory(
      () => InstructorsProvider(instructorsUsecase: di())); //provider
  di.registerLazySingleton(
      () => InstructorsUsecase(repository: di())); //usecase
  di.registerLazySingleton<InstructorsRepository>(
      () => InstructorsRepositoryImpl(remoteDatasource: di())); //repository
  di.registerLazySingleton<InstructorsRemoteDatasource>(
      () => InstructorsRemoteDatasourceImpl()); //datasource

  //Reservation
  di.registerFactory(
      () => ReservationProvider(reservationUsecase: di())); //provider
  di.registerLazySingleton(
      () => ReservationUsecase(repository: di())); //usecase
  di.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(remoteDatasource: di())); //repository
  di.registerLazySingleton<ReservationRemoteDatasource>(
      () => ReservationRemoteDatasourceImpl()); //datasource
}
