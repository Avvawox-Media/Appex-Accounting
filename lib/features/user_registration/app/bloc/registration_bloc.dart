import 'dart:async';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/get_users.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/register_user.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/remove_user.dart';
import 'package:appex_accounting/features/user_registration/domain/usecases/update_user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUser registerUser;
  final UpdateUser updateUser;
  final GetUsers getUsers;
  final RemoveUser removeUser;

  RegistrationBloc({
    @required this.registerUser,
    @required this.updateUser,
    @required this.getUsers,
    @required this.removeUser,
  }) : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegisterUserEvent) {
      //Emits Loading State
      yield RegistrationLoading();

      final registerOrFail = await registerUser(
        RegistrationParams(
          name: event.name,
          email: event.email,
          phone: event.phone,
          gender: event.gender,
          role: event.role,
          password: event.password,
        ),
      );

      //Emits Loaded State
      yield registerOrFail.fold(
        (failure) => RegistrationError(failure),
        (index) => RegistrationLoaded(index),
      );
    } else if (event is UpdateUserEvent) {
      //Emits Loading State
      yield RegistrationLoading();

      final registerOrFail = await updateUser(
        UpdateParams(
          name: event.name,
          email: event.email,
          phone: event.phone,
          gender: event.gender,
          role: event.role,
          password: event.password,
        ),
      );

      //Emits Loaded State
      yield registerOrFail.fold(
        (failure) => RegistrationError(failure),
        (index) => UserUpdateLoaded(),
      );
    }
  }
}
