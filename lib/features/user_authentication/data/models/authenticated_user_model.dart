import 'dart:convert';

import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUser {
  AuthenticatedUserModel(
      {String username, String password, String sessionToken})
      : super(
            username: username, password: password, sessionToken: sessionToken);

  factory AuthenticatedUserModel.fromJson(String jsonString) {
    //Decode JSON String
    final data = json.decode(jsonString);

    return AuthenticatedUserModel(
      username: data['username'],
      password: data['password'],
      sessionToken: data['session_token'],
    );
  }

  String toJson() {
    Map<String, dynamic> map = {
      'username': username,
      'password': password,
      'session_token': sessionToken,
    };

    return json.encode(map);
  }
}
