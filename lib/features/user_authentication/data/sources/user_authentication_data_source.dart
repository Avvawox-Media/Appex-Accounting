import 'package:appex_accounting/core/database/database_helper.dart';
import 'package:appex_accounting/core/exceptions/exceptions.dart';
import 'package:appex_accounting/core/failure/failures.dart';
import 'package:appex_accounting/core/utils/strings.dart';
import 'package:appex_accounting/features/user_authentication/data/models/authenticated_user_model.dart';

abstract class UserAuthenticationDataSource {
  Future<AuthenticatedUserModel> authenticateUser(
      String username, String password);
}

class UserAuthenticationDataSourceImpl implements UserAuthenticationDataSource {
  final DatabaseHelper databaseHelper;

  UserAuthenticationDataSourceImpl(this.databaseHelper);

  @override
  Future<AuthenticatedUserModel> authenticateUser(
    String username,
    String password,
  ) async {
    //Initialize Database
    await databaseHelper.initDatabase();
    await databaseHelper.open(USERS_BOX);

    List<String> userDataList = await databaseHelper.getAllItem(USERS_BOX);

    for (String userData in userDataList) {
      final userModel = AuthenticatedUserModel.fromJson(userData);

      String verifiedUser = userModel.username;

      //Encrypt and match Password Here
      String verifiedPassword = userModel.password;

      if (verifiedUser != username)
        // throw UserNotFoundException();
        throw DatabaseException();
      else if (verifiedPassword != password)
        // throw IncorrectPasswordException();
        throw DatabaseException();
      else
        return userModel;
    }

    throw DatabaseException();
  }
}
