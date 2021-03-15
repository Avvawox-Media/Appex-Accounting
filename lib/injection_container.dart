import 'dart:io';

import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/features/user_authentication/data/repositories/user_authentication_repository_impl.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:appex_accounting/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:appex_accounting/features/user_registration/app/bloc/registration_bloc.dart';
import 'package:appex_accounting/features/user_registration/data/repositories/registration_repository_impl.dart';
import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/register_user.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/update_user.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'features/user_authentication/app/bloc/authentication_bloc.dart';
import 'features/user_authentication/data/sources/user_authentication_data_source.dart';
import 'features/user_registration/data/sources/registration_data_source.dart';
import 'features/user_registration/domain/usecases/get_users.dart';
import 'features/user_registration/domain/usecases/remove_user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

GetIt sl = GetIt.instance;

Future<void> init() async {
  ////////////////////////////////////////////////////////
  /// APPPLICATION LAYER

  //Registration Bloc
  sl.registerFactory(
    () => RegistrationBloc(
      registerUser: sl(),
      updateUser: sl(),
      getUsers: sl(),
      removeUser: sl(),
    ),
  );

  // Authentication Bloc
  sl.registerFactory(
    () => AuthenticationBloc(sl()),
  );

  ////////////////////////////////////////////////////////
  /// DOMAIN LAYER

  // Registration Usecases
  sl.registerLazySingleton(() => RegisterUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => RemoveUser(sl()));

  // Authentication Usecase
  sl.registerLazySingleton(() => AuthenticateUser(sl()));

  // Registration Repository
  sl.registerLazySingleton<RegistrationRepository>(
    () => RegistrationRepositoryImpl(
      sl(),
    ),
  );

  // Authentication Repository
  sl.registerLazySingleton<UserAuthenticationRepository>(
    () => UserAuthenticationRepositoryImpl(
      sl(),
    ),
  );

  ////////////////////////////////////////////////////////
  /// DATA LAYER

  // Registration Data Source
  sl.registerLazySingleton<RegistrationDataSourceImpl>(
    () => RegistrationDataSourceImpl(
      sl(),
    ),
  );

  // Authentication Data Source
  sl.registerLazySingleton<UserAuthenticationDataSource>(
    () => UserAuthenticationDataSourceImpl(
      sl(),
    ),
  );

  ////////////////////////////////////////////////////////
  /// CORE

  // DatabaseHelper
  final helper = DatabaseHelper.instance;
  sl.registerLazySingleton(() => helper);
  await helper.initDatabase();

  ////////////////////////////////////////////////////////
  /// EXTERNAL

  //Hive Database
  // sl.registerLazySingleton(() => Hive.init(sl()));

  //Path Provider
  // final directory = await path_provider.getApplicationDocumentsDirectory();
  // sl.registerLazySingleton(() => directory.path);
}
