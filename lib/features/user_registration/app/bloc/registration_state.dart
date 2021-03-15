part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationLoaded extends RegistrationState {
  final int index;

  RegistrationLoaded(this.index);
}

class UserUpdateLoaded extends RegistrationState {}

class RegistrationError extends RegistrationState {
  final Failure failure;

  RegistrationError(this.failure);
}
