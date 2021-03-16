import 'package:equatable/equatable.dart';

class AuthenticatedUser extends Equatable {
  final String staffId;
  final String name;
  final String email;
  final String role;
  final String gender;
  final String password;
  final String phone;

  AuthenticatedUser({
    this.staffId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.password,
    this.phone,
  });

  @override
  List<Object> get props =>
      [staffId, name, email, role, gender, password, phone];
}
