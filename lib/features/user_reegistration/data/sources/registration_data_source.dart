import 'package:appex_accounting/core/failure/failures.dart';
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
    throw UnimplementedError();
  }
}
