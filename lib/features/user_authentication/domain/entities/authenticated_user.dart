import 'package:equatable/equatable.dart';

class AuthenticatedUser extends Equatable {
  final String username;
  final String password;
  final String sessionToken;

  AuthenticatedUser({this.sessionToken, this.username, this.password});

  @override
  List<Object> get props => [sessionToken];
}
