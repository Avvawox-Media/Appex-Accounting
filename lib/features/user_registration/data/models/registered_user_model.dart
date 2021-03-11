import 'dart:convert';

import '../../domain/entities/registered_user.dart';

class RegisteredUserModel extends RegisteredUser {
  final String staffId;
  final String name;
  final String email;
  final String role;
  final String gender;
  final String password;
  final String phone;

  RegisteredUserModel({
    this.staffId,
    this.name,
    this.email,
    this.role,
    this.gender,
    this.password,
    this.phone,
  }) : super(
          staffId: staffId,
          name: name,
          email: email,
          role: role,
          gender: gender,
          password: password,
          phone: phone,
        );

  factory RegisteredUserModel.fromJson(String jsonString) {
    final data = json.decode(jsonString);

    return RegisteredUserModel(
      staffId: data['staff_id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      gender: data['gender'],
      phone: data['phone'],
      password: data['password'],
    );
  }

  String toJson() {
    Map map = {
      'staff_id': staffId,
      'name': name,
      'email': email,
      'role': role,
      'gender': gender,
      'phone': phone,
      'password': password,
    };

    final data = json.encode(map);

    return data;
  }
}
