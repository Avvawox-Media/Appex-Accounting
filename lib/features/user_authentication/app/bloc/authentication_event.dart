part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateUserEvent extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticateUserEvent(this.username, this.password);
}
