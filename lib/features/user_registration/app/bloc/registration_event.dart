part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegistrationEvent {
  final String name;
  final String staffId;
  final String role;
  final String email;
  final String phone;
  final String password;
  final String gender;

  RegisterUserEvent(
    this.name,
    this.staffId,
    this.role,
    this.email,
    this.phone,
    this.password,
    this.gender,
  );
}

class UpdateUserEvent extends RegistrationEvent {
  final String name;
  final String staffId;
  final String role;
  final String email;
  final String phone;
  final String password;
  final String gender;

  UpdateUserEvent(
    this.name,
    this.staffId,
    this.role,
    this.email,
    this.phone,
    this.password,
    this.gender,
  );
}

class RemoveUserEvent extends RegistrationEvent {}

class GetUsersEvent extends RegistrationEvent {}
