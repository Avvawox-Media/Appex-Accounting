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
    final userData = RegisteredUserModel(
      staffId: staffId,
      name: name,
      role: role,
      email: email,
      phone: phone,
      password: password,
      gender: gender,
    ).toJson();

    //save to database
    return await databaseHelper.save(USERS_BOX, userData);
  }
}
