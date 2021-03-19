import 'dart:io';

import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/features/services/app/bloc/service_bloc.dart';
import 'package:appex_accounting/features/services/data/repositories/service_repository_impl.dart';
import 'package:appex_accounting/features/services/data/sources/service_data_source.dart';
import 'package:appex_accounting/features/services/domain/repositories/service_repository.dart';
import 'package:appex_accounting/features/services/domain/usecases/create_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/delete_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/get_service.dart';
import 'package:appex_accounting/features/services/domain/usecases/get_services.dart';
import 'package:appex_accounting/features/services/domain/usecases/update_service.dart';
import 'package:appex_accounting/features/user_authentication/data/repositories/user_authentication_repository_impl.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:appex_accounting/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:appex_accounting/features/user_registration/app/bloc/registration_bloc.dart';
import 'package:appex_accounting/features/user_registration/data/repositories/registration_repository_impl.dart';
import 'package:appex_accounting/features/user_registration/domain/repositories/registration_repository.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/register_user.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/update_user.dart';
import 'package:get_it/get_it.dart';
import 'features/user_authentication/app/bloc/authentication_bloc.dart';
import 'features/user_authentication/data/sources/user_authentication_data_source.dart';
import 'features/user_registration/data/sources/registration_data_source.dart';
import 'features/user_registration/domain/usecases/get_users.dart';
import 'features/user_registration/domain/usecases/remove_user.dart';

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

  //Service Bloc
  sl.registerFactory(
    () => ServiceBloc(
      createService: sl(),
      updateService: sl(),
      getService: sl(),
      getServices: sl(),
      deleteService: sl(),
    ),
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

  // Service Usecases
  sl.registerLazySingleton(() => CreateService(sl()));
  sl.registerLazySingleton(() => UpdateService(sl()));
  sl.registerLazySingleton(() => GetService(sl()));
  sl.registerLazySingleton(() => GetServices(sl()));
  sl.registerLazySingleton(() => DeleteService(sl()));

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

  // Service Repository
  sl.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(
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
  sl.registerLazySingleton<UserAuthenticationDataSourceImpl>(
    () => UserAuthenticationDataSourceImpl(
      sl(),
    ),
  );

  // Service Data Source
  sl.registerLazySingleton<ServiceDataSourceImpl>(
    () => ServiceDataSourceImpl(
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
}
