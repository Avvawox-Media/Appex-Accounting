import 'dart:convert';

import 'package:appex_accounting/features/user_authentication/domain/entities/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUser {
  AuthenticatedUserModel({
    String staffId,
    String name,
    String email,
    String role,
    String gender,
    String password,
    String phone,
  }) : super(
          name: name,
          password: password,
          email: email,
          role: role,
          gender: gender,
          phone: phone,
          staffId: staffId,
        );

  factory AuthenticatedUserModel.fromJson(String jsonString) {
    //Decode JSON String
    final data = json.decode(jsonString);

    return AuthenticatedUserModel(
      name: data['name'],
      email: data['email'],
      role: data['role'],
      gender: data['gender'],
      phone: data['phone'],
      password: data['password'],
    );
  }

  String toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'password': password,
      'email': email,
      'role': role,
      'gender': gender,
      'phone': phone,
    };

    return json.encode(map);
  }
}
