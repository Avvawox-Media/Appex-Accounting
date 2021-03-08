import 'package:equatable/equatable.dart';

class RegisteredUser extends Equatable {
  final int userId;

  const RegisteredUser(this.userId);

  @override
  List<Object> get props => [userId];
}
