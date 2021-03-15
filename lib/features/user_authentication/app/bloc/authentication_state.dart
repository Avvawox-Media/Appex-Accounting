part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationDone extends AuthenticationState {
  final AuthenticatedUser authenticatedUser;

  AuthenticationDone(this.authenticatedUser);
}

class AuthenticationError extends AuthenticationState {
  final Failure failure;

  AuthenticationError(this.failure);
}
