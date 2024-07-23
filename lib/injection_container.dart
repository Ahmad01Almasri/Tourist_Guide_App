import 'package:tourist_guide/features/auth/data/repositories_impl/user_repo_imp.dart';
import 'package:tourist_guide/features/auth/domain/repositories/user_repo.dart';
import 'package:tourist_guide/features/historical/data/data_sources/historical_remote_data_source.dart';
import 'package:tourist_guide/features/historical/data/repositories_impl/historical_repo_impl.dart';
import 'package:tourist_guide/features/historical/domain/repositories/histprical_repository.dart';
import 'package:tourist_guide/features/historical/domain/use_cases/get_all_historicals.dart';
import 'package:tourist_guide/features/historical/presentation/blocs/historicals_bloc.dart';

import 'core/network/network_info.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/data_sources/user_remote_data_source.dart';
import 'features/auth/domain/use_cases/login_usecase.dart';
import 'features/auth/domain/use_cases/signup_usecase.dart';
import 'features/auth/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features

// Bloc
  sl.registerFactory(() => UserBloc(signUpUser: sl(), loginUser: sl()));
  sl.registerFactory(() => HistoricalBloc(getAllHistorical: sl()));

// Usecases
  sl.registerLazySingleton(() => LoginUserUsecase(sl()));
  sl.registerLazySingleton(() => SignUpUserUsecase(sl()));
  sl.registerLazySingleton(() => GetAllHistoricalUsecase(sl()));
// Repository
  sl.registerLazySingleton<UserRepository>(
      () => UsersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HistoricalRepository>(() =>
      HistoricalRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
// Datasources

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<HistoricalRemoteDataSource>(
      () => HistoricalRemoteDataSourceImpl(client: sl()));
//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
