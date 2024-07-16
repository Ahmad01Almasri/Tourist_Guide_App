import 'package:tourist_guide/features/auth/data/repositories_impl/user_repo_imp.dart';
import 'package:tourist_guide/features/auth/domain/repositories/user_repo.dart';

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
//! Features - posts

// Bloc
  sl.registerFactory(() => UserBloc(signUpUser: sl()));

// Usecases
  sl.registerLazySingleton(() => LoginUserUsecase(sl()));
  sl.registerLazySingleton(() => SignUpUserUsecase(sl()));

// Repository
  sl.registerLazySingleton<UserRepository>(
      () => UsersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
