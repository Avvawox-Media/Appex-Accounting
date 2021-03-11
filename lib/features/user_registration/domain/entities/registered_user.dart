import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisteredUser extends Equatable {
  final String staffId;
  final String name;
  final String email;
  final String role;
  final String gender;
  final String password;
  final String phone;

  const RegisteredUser({
    this.staffId,
    @required this.name,
    @required this.email,
    @required this.role,
    @required this.gender,
    @required this.password,
    @required this.phone,
  });

  @override
  List<Object> get props =>
      [staffId, name, email, role, gender, password, phone];
}
