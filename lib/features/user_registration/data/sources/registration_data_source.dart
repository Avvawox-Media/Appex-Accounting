import 'package:crypt/crypt.dart';

import '../../../../core/database/database_helper.dart';
import '../../../../core/utils/strings.dart';
import '../models/registered_user_model.dart';
import 'package:meta/meta.dart';

abstract class RegistrationDataSource {
  Future<int> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  });

  Future<void> updateUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  });
}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  final DatabaseHelper databaseHelper;

  RegistrationDataSourceImpl(this.databaseHelper);

  @override
  Future<int> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  }) async {
    //Try Encrypting Password
    final encryptedPassword = Crypt.sha256(password, salt: 'axcecpopuan@t');

    final userData = RegisteredUserModel(
      staffId: staffId,
      name: name,
      role: role,
      email: email,
      phone: phone,
      password: encryptedPassword.toString(),
      gender: gender,
    ).toJson();

    //save to database
    return await databaseHelper.save(USERS_BOX, userData);
  }

  @override
  Future<bool> updateUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  }) async {
    final registeredUser = RegisteredUserModel(
      staffId: staffId,
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
      role: role,
    ).toJson();

    await databaseHelper.update(email, USERS_BOX, registeredUser);
    return true;
  }
}
