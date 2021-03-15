import 'dart:async';

import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';
import 'package:appex_accounting/features/user_authentication/domain/repositories/user_authentication_repository.dart';
import 'package:appex_accounting/features/user_authentication/domain/usecases/authenticate_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateUser authenticateUser;

  AuthenticationBloc(this.authenticateUser) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticateUserEvent) {
      //Emit Loading State
      yield AuthenticationLoading();

      final resultOrFailure = await authenticateUser(
        AuthParams(
          event.username,
          event.password,
        ),
      );
    }
  }
}
