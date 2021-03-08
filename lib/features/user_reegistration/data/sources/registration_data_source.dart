import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_reegistration/data/models/registered_user_model.dart';
import 'package:meta/meta.dart';

abstract class RegistrationDataSource {
  Future<RegisteredUserModel> registerUser({
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
  Future<RegisteredUserModel> registerUser({
    @required String name,
    String staffId,
    @required String role,
    @required String email,
    @required String phone,
    @required String password,
    @required String gender,
  }) async {
    DatabaseHelper instance = DatabaseHelper.instance;

    int id = await instance.insertData(
      tableName: USERS_TABLE,
      data: {
        'staff_id': staffId,
        'name': name,
        'email': email,
        'role': role,
        'phone': phone,
        'gender': gender,
        'password': password,
      },
    );

    return RegisteredUserModel(id);
  }
}
