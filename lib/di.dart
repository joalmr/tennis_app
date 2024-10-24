import 'package:get_it/get_it.dart';
import 'package:tennis_app/src/app/user/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tennis_app/src/app/user/data/repositories/auth_repository_impl.dart';
import 'package:tennis_app/src/app/user/domain/repositories/auth_repository.dart';
import 'package:tennis_app/src/app/user/domain/usecases/auth_usecase.dart';
import 'package:tennis_app/src/app/user/presentation/provider/auth_provider.dart';

final di = GetIt.instance;

Future<void> init() async {
  //AUTH
  di.registerFactory(() => AuthProvider(di())); //provider
  di.registerLazySingleton(() => AuthUsecase(repository: di())); //usecase
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: di())); //repository
  di.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl()); //datasource
}
